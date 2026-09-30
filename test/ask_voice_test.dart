import 'package:bookkeeper_app/ask_voice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('money is read as rupees, markdown and bullets are dropped', () {
    expect(
      AskVoice.forSpeech('Sales were Rs 1,234.50 and **good**.\n- Rice is low'),
      'Sales were 1,234.50 rupees and good. Rice is low',
    );
  });
  test('the picked voice is remembered; unknown voices are ignored', () async {
    SharedPreferences.setMockInitialValues({});
    final first = AskVoice();
    await first.loadSettings();
    expect(first.voice, 'Leda');
    await first.setVoice('Aoede');
    await first.setVoice('NotAVoice');
    expect(first.voice, 'Aoede');

    final relaunched = AskVoice();
    await relaunched.loadSettings();
    expect(relaunched.voice, 'Aoede');
  });
  test('pace and tone are remembered; invalid values are ignored', () async {
    SharedPreferences.setMockInitialValues({});
    final voice = AskVoice();
    await voice.setPace('slower');
    await voice.setPace('warp');
    await voice.setTone('calm');
    await voice.setTone('angry');
    expect(voice.settingsKey, 'Leda|slower|calm');

    final relaunched = AskVoice();
    await relaunched.loadSettings();
    expect(relaunched.settingsKey, 'Leda|slower|calm');
  });
  test('the first sentence is split off so it can be voiced early', () {
    expect(
      AskVoice.splitFirstSentence(
        'You have 0 low-stock items. All levels are fine, so nothing is low.',
      ),
      ['You have 0 low-stock items.', 'All levels are fine, so nothing is low.'],
    );
    expect(AskVoice.splitFirstSentence('Sales were 1,234.50 rupees today'), [
      'Sales were 1,234.50 rupees today',
    ]);
    expect(AskVoice.splitFirstSentence('Hi. Rice is low.'), ['Hi. Rice is low.']);
    expect(AskVoice.splitFirstSentence('Only one sentence here.'), [
      'Only one sentence here.',
    ]);
    expect(
      AskVoice.splitFirstSentence('آج کی فروخت بہت اچھی رہی۔ چاول کم ہیں'),
      ['آج کی فروخت بہت اچھی رہی۔', 'چاول کم ہیں'],
    );
  });
}
