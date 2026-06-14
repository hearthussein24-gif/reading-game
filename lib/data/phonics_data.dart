/// Core phonics data used across the game.
///
/// NOTE on sounds: We use Flutter's built-in text-to-speech (TTS) engine.
/// TTS reads letters as their *names* by default (e.g. "B" -> "bee"), so for
/// the phonics *sounds* (e.g. the /b/ sound) we feed it phonetic spellings
/// instead (e.g. "buh"). These are approximations and can be tuned by
/// editing the `soundText` values below without touching any game logic.

class LetterSound {
  final String letter; // The letter shown on screen, e.g. "B"
  final String soundText; // What TTS says for the *sound*, e.g. "buh"
  final String letterName; // What TTS says for the letter *name*, e.g. "B" -> "bee"

  const LetterSound({
    required this.letter,
    required this.soundText,
    required this.letterName,
  });
}

/// Level 1: Consonant sounds
const List<LetterSound> consonants = [
  LetterSound(letter: 'B', soundText: 'buh', letterName: 'B'),
  LetterSound(letter: 'C', soundText: 'kuh', letterName: 'C'),
  LetterSound(letter: 'D', soundText: 'duh', letterName: 'D'),
  LetterSound(letter: 'F', soundText: 'fff', letterName: 'F'),
  LetterSound(letter: 'G', soundText: 'guh', letterName: 'G'),
  LetterSound(letter: 'H', soundText: 'huh', letterName: 'H'),
  LetterSound(letter: 'J', soundText: 'juh', letterName: 'J'),
  LetterSound(letter: 'K', soundText: 'kuh', letterName: 'K'),
  LetterSound(letter: 'L', soundText: 'lll', letterName: 'L'),
  LetterSound(letter: 'M', soundText: 'mmm', letterName: 'M'),
  LetterSound(letter: 'N', soundText: 'nnn', letterName: 'N'),
  LetterSound(letter: 'P', soundText: 'puh', letterName: 'P'),
  LetterSound(letter: 'R', soundText: 'rrr', letterName: 'R'),
  LetterSound(letter: 'S', soundText: 'sss', letterName: 'S'),
  LetterSound(letter: 'T', soundText: 'tuh', letterName: 'T'),
  LetterSound(letter: 'V', soundText: 'vvv', letterName: 'V'),
  LetterSound(letter: 'W', soundText: 'wuh', letterName: 'W'),
  LetterSound(letter: 'Y', soundText: 'yuh', letterName: 'Y'),
  LetterSound(letter: 'Z', soundText: 'zzz', letterName: 'Z'),
];

/// Level 2: Short vowel sounds
const List<LetterSound> vowels = [
  LetterSound(letter: 'A', soundText: 'ah', letterName: 'A'),
  LetterSound(letter: 'E', soundText: 'eh', letterName: 'E'),
  LetterSound(letter: 'I', soundText: 'ih', letterName: 'I'),
  LetterSound(letter: 'O', soundText: 'aw', letterName: 'O'),
  LetterSound(letter: 'U', soundText: 'uh', letterName: 'U'),
];

/// Level 3: Consonant + vowel syllables (simple CV blends)
class Syllable {
  final String consonant;
  final String vowel;
  final String soundText; // The blended sound, e.g. "ba"

  const Syllable({
    required this.consonant,
    required this.vowel,
    required this.soundText,
  });
}

const List<Syllable> syllables = [
  Syllable(consonant: 'B', vowel: 'A', soundText: 'ba'),
  Syllable(consonant: 'M', vowel: 'A', soundText: 'ma'),
  Syllable(consonant: 'S', vowel: 'I', soundText: 'si'),
  Syllable(consonant: 'T', vowel: 'O', soundText: 'to'),
  Syllable(consonant: 'D', vowel: 'U', soundText: 'du'),
  Syllable(consonant: 'P', vowel: 'E', soundText: 'pe'),
  Syllable(consonant: 'N', vowel: 'O', soundText: 'no'),
  Syllable(consonant: 'F', vowel: 'I', soundText: 'fi'),
  Syllable(consonant: 'H', vowel: 'A', soundText: 'ha'),
  Syllable(consonant: 'L', vowel: 'U', soundText: 'lu'),
];
