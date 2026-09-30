package com.talreja.bookkeeper

import androidx.core.content.FileProvider

// Its own subclass so it can't collide with the FileProviders that plugins
// (share_plus, image_picker) already declare. Serves the downloaded update APK.
class ApkFileProvider : FileProvider()
