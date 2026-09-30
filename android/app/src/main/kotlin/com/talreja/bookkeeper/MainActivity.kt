package com.talreja.bookkeeper

import android.app.UiModeManager
import android.content.ContentValues
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.provider.Settings
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

// FlutterFragmentActivity, not FlutterActivity — local_auth's BiometricPrompt
// (see lib/app_lock_service.dart) requires a FragmentActivity host.
class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "bookkeeper/save"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "saveToDownloads" -> {
                        val filename = call.argument<String>("filename") ?: "backup.db"
                        val bytes = call.argument<ByteArray>("bytes")
                        if (bytes == null) {
                            result.error("INVALID_ARGUMENTS", "bytes is required", null)
                        } else {
                            try {
                                result.success(saveToDownloads(filename, bytes))
                            } catch (e: Exception) {
                                result.error("SAVE_FAILED", e.message, null)
                            }
                        }
                    }
                    "versionCode" -> {
                        val info = packageManager.getPackageInfo(packageName, 0)
                        result.success(
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) info.longVersionCode
                            else @Suppress("DEPRECATION") info.versionCode.toLong()
                        )
                    }
                    "installApk" -> {
                        try {
                            result.success(installApk(call.argument<String>("path") ?: ""))
                        } catch (e: Exception) {
                            result.error("INSTALL_FAILED", e.message, null)
                        }
                    }
                    "setNightMode" -> {
                        setApplicationNightMode(call.argument<String>("mode"))
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    /**
     * Registers the app's own light/dark preference with the OS itself
     * (Android 12+ / API 31+ only — older versions have no per-app override
     * and just keep following the system setting). Unlike an in-process
     * override, this persists at the system level, so it's what the
     * OS-drawn splash screen (painted before any of our code runs on the
     * next cold start, see lib/auth/auth_gate.dart's _BootSplash) reads —
     * without it, that first frame always follows the device's system
     * theme even when the user picked something else inside the app.
     */
    private fun setApplicationNightMode(mode: String?) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return
        val uiModeManager = getSystemService(UiModeManager::class.java) ?: return
        uiModeManager.setApplicationNightMode(
            when (mode) {
                "dark" -> UiModeManager.MODE_NIGHT_YES
                "light" -> UiModeManager.MODE_NIGHT_NO
                else -> UiModeManager.MODE_NIGHT_AUTO
            }
        )
    }

    /**
     * Hands a downloaded APK to the system installer. Returns "started", or
     * "needs_permission" after opening the "install unknown apps" screen for
     * this app (Android asks once; the user allows it, then taps Update again).
     */
    private fun installApk(path: String): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && !packageManager.canRequestPackageInstalls()) {
            startActivity(
                Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:$packageName"))
            )
            return "needs_permission"
        }
        val uri = FileProvider.getUriForFile(this, "$packageName.apkprovider", File(path))
        startActivity(
            Intent(Intent.ACTION_VIEW)
                .setDataAndType(uri, "application/vnd.android.package-archive")
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        )
        return "started"
    }

    /** Guesses a MIME type from [filename]'s extension for the Downloads entry. */
    private fun mimeTypeFor(filename: String): String = when {
        filename.endsWith(".csv", ignoreCase = true) -> "text/csv"
        filename.endsWith(".db", ignoreCase = true) -> "application/x-sqlite3"
        filename.endsWith(".apk", ignoreCase = true) -> "application/vnd.android.package-archive"
        else -> "application/octet-stream"
    }

    /**
     * Saves [bytes] as [filename] to the phone's public Downloads folder.
     *
     * API 29+ (Android 10+): uses MediaStore.Downloads — no permissions needed.
     * Older devices: falls back to the app's external Download dir (still on
     * external storage, but not in the public Downloads folder).
     */
    private fun saveToDownloads(filename: String, bytes: ByteArray): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val resolver = applicationContext.contentResolver
            val values = ContentValues().apply {
                put(MediaStore.Downloads.DISPLAY_NAME, filename)
                put(MediaStore.Downloads.MIME_TYPE, mimeTypeFor(filename))
                put(MediaStore.Downloads.IS_PENDING, 1)
            }
            val uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values)
                ?: throw Exception("Could not create file in Downloads")
            try {
                resolver.openOutputStream(uri)?.use { it.write(bytes) }
                    ?: throw Exception("Could not write file")
            } catch (e: Exception) {
                resolver.delete(uri, null, null)
                throw e
            }
            values.clear()
            values.put(MediaStore.Downloads.IS_PENDING, 0)
            resolver.update(uri, values, null, null)
            return filename
        } else {
            val dir = getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS)
                ?: throw Exception("External storage not available")
            if (!dir.exists()) dir.mkdirs()
            File(dir, filename).writeBytes(bytes)
            return filename
        }
    }
}
