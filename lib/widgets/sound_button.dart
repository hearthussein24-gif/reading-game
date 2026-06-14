import 'package:flutter/material.dart';
import '../services/audio_service.dart';

/// A big tappable letter/sound button.
///
/// Tapping it ALWAYS speaks [spokenText] (per game design: every sound
/// button should play its sound when touched), and also fires [onTap]
/// for any game-logic checks (e.g. "was this the right answer?").
class SoundButton extends StatelessWidget {
  final String label;
  final String spokenText;
  final VoidCallback? onTap;
  final Color color;

  const SoundButton({
    super.key,
    required this.label,
    required this.spokenText,
    this.onTap,
    this.color = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AudioService.instance.speak(spokenText);
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
