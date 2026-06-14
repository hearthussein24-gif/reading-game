import 'dart:math';
import 'package:flutter/material.dart';
import '../data/phonics_data.dart';
import '../services/audio_service.dart';
import '../widgets/sound_button.dart';

/// Level 1: The game plays a consonant SOUND, and the player taps the
/// letter that makes that sound. Every button also speaks its own sound
/// when tapped.
class Level1Screen extends StatefulWidget {
  const Level1Screen({super.key});

  @override
  State<Level1Screen> createState() => _Level1ScreenState();
}

class _Level1ScreenState extends State<Level1Screen> {
  final Random _random = Random();
  late LetterSound _target;
  late List<LetterSound> _options;
  int _score = 0;
  int _round = 1;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    _target = consonants[_random.nextInt(consonants.length)];

    final optionsSet = <LetterSound>{_target};
    while (optionsSet.length < 4) {
      optionsSet.add(consonants[_random.nextInt(consonants.length)]);
    }
    _options = optionsSet.toList()..shuffle(_random);
    _feedback = null;

    setState(() {});

    Future.delayed(const Duration(milliseconds: 400), () {
      AudioService.instance.speak(_target.soundText);
    });
  }

  void _checkAnswer(LetterSound chosen) {
    if (chosen.letter == _target.letter) {
      setState(() {
        _feedback = 'Great job! 🎉';
        _score++;
      });
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        setState(() => _round++);
        _newRound();
      });
    } else {
      setState(() => _feedback = 'Try again!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 1: Consonant Sounds'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Round $_round   •   Score: $_score', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => AudioService.instance.speak(_target.soundText),
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen again'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tap the letter that makes this sound!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: _options
                  .map((o) => SoundButton(
                        label: o.letter,
                        spokenText: o.soundText,
                        onTap: () => _checkAnswer(o),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 32),
            if (_feedback != null)
              Text(
                _feedback!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _feedback!.contains('Great') ? Colors.green : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
