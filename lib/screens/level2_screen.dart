import 'dart:math';
import 'package:flutter/material.dart';
import '../data/phonics_data.dart';
import '../services/audio_service.dart';
import '../widgets/sound_button.dart';

class Level2Screen extends StatefulWidget {
  const Level2Screen({super.key});

  @override
  State<Level2Screen> createState() => _Level2ScreenState();
}

class _Level2ScreenState extends State<Level2Screen> {
  final Random _random = Random();
  late PhonicData _target;
  late List<PhonicData> _options;
  int _score = 0;
  int _round = 1;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    _options = List.of(vowels)..shuffle(_random);
    _target = vowels[_random.nextInt(vowels.length)];
    _feedback = null;

    setState(() {});

    Future.delayed(const Duration(milliseconds: 400), () {
      AudioService.playLetter(_target.audioFile);
    });
  }

  void _checkAnswer(PhonicData chosen) {
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
        title: const Text('Level 2: Vowel Sounds'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Round $_round   •   Score: $_score',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => AudioService.playLetter(_target.audioFile),
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen again'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tap the vowel that makes this sound!',
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
                        audioFile: o.audioFile,
                        color: Colors.blue,
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
                  color: _feedback!.contains('Great')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
