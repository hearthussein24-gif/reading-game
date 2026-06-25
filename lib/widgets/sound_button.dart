import 'package:flutter/material.dart';
import '../services/audio_service.dart';

class SoundButton extends StatelessWidget {
  final String label;
  final String audioFile;
  final VoidCallback? onTap;
  final Color color;

  const SoundButton({
    super.key,
    required this.label,
    required this.audioFile,
    this.onTap,
    this.color = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AudioService.playLetter(audioFile);
        onTap?.call();
      },
      child: Container(
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
