import 'dart:math';
import 'package:flutter/material.dart';
import '../data/phonics_data.dart';
import '../services/audio_service.dart';
import '../widgets/sound_button.dart';

/// Level 3: The game plays a blended consonant+vowel sound (e.g. "ba").
/// The player must tap the correct consonant AND the correct vowel.
/// Each button still speaks its own sound when tapped.
class Level3Screen extends StatefulWidget {
  const Level3Screen({super.key});

  @override
  State<Level3Screen> createState() => _Level3ScreenState();
}

class _Level3ScreenState extends State<Level3Screen> {
  final Random _random = Random();
  late Syllable _target;
  late List<LetterSound> _consonantOptions;
  late List<LetterSound> _vowelOptions;
  late String _targetConsonant;
  late String _targetVowel;
  bool _consonantCorrect = false;
  bool _vowelCorrect = false;
  int _score = 0;
  int _round = 1;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  LetterSound _findConsonant(String letter) =>
      consonants.firstWhere((c) => c.letter == letter);

  LetterSound _findVowel(String letter) =>
      vowels.firstWhere((v) => v.letter == letter);

  void _newRound() {
    _target = syllables[_random.nextInt(syllables.length)];
    _targetConsonant = _target.consonant;
    _targetVowel = _target.vowel;

    final cOptions = <LetterSound>{_findConsonant(_targetConsonant)};
    while (cOptions.length < 3) {
      cOptions.add(consonants[_random.nextInt(consonants.length)]);
    }
    _consonantOptions = cOptions.toList()..shuffle(_random);
    _vowelOptions = List.of(vowels)..shuffle(_random);

    _consonantCorrect = false;
    _vowelCorrect = false;
    _feedback = null;

    setState(() {});

    Future.delayed(const Duration(milliseconds: 400), () {
      AudioService.instance.speak(_target.soundText);
    });
  }

  void _checkConsonant(LetterSound chosen) {
    if (chosen.letter == _targetConsonant) {
      setState(() => _consonantCorrect = true);
      _maybeComplete();
    } else {
      setState(() => _feedback = 'Try again!');
    }
  }

  void _checkVowel(LetterSound chosen) {
    if (chosen.letter == _targetVowel) {
      setState(() => _vowelCorrect = true);
      _maybeComplete();
    } else {
      setState(() => _feedback = 'Try again!');
    }
  }

  void _maybeComplete() {
    if (_consonantCorrect && _vowelCorrect) {
      setState(() {
        _feedback = 'Great job! 🎉';
        _score++;
      });
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        setState(() => _round++);
        _newRound();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 3: Syllables'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Round $_round   •   Score: $_score', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => AudioService.instance.speak(_target.soundText),
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen again'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pick the consonant and vowel that make this sound!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Text('Consonant', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: _consonantOptions
                  .map((c) => SoundButton(
                        label: c.letter,
                        spokenText: c.soundText,
                        color: _consonantCorrect && c.letter == _targetConsonant
                            ? Colors.green
                            : Colors.deepOrange,
                        onTap: () => _checkConsonant(c),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            const Text('Vowel', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: _vowelOptions
                  .map((v) => SoundButton(
                        label: v.letter,
                        spokenText: v.soundText,
                        color: _vowelCorrect && v.letter == _targetVowel
                            ? Colors.green
                            : Colors.blue,
                        onTap: () => _checkVowel(v),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
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
