import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> playLetter(String letter) async {
    final path = 'audio/letters/${letter.toLowerCase()}.mp3';
    await _player.stop();
    await _player.play(AssetSource(path));
  }

  static Future<void> stop() async {
    await _player.stop();
  }
}
