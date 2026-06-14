import 'package:flutter_tts/flutter_tts.dart';

/// Simple wrapper around flutter_tts so the rest of the app can just call
/// `AudioService.instance.speak('buh')` without worrying about setup.
class AudioService {
  AudioService._internal() {
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.4); // slower, clearer for early readers
    _tts.setPitch(1.1); // slightly higher pitch, friendlier for kids
  }

  static final AudioService instance = AudioService._internal();

  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }
}
