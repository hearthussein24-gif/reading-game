class PhonicData {
  final String letter;
  final String audioFile;

  const PhonicData({
    required this.letter,
    required this.audioFile,
  });
}

final List<PhonicData> consonants = [
  PhonicData(letter: 'b', audioFile: 'b'),
  PhonicData(letter: 'c', audioFile: 'c'),
  PhonicData(letter: 'd', audioFile: 'd'),
  PhonicData(letter: 'f', audioFile: 'f'),
  PhonicData(letter: 'g', audioFile: 'g'),
  PhonicData(letter: 'h', audioFile: 'h'),
  PhonicData(letter: 'j', audioFile: 'j'),
  PhonicData(letter: 'k', audioFile: 'k'),
  PhonicData(letter: 'l', audioFile: 'l'),
  PhonicData(letter: 'm', audioFile: 'm'),
  PhonicData(letter: 'n', audioFile: 'n'),
  PhonicData(letter: 'p', audioFile: 'p'),
  PhonicData(letter: 'q', audioFile: 'q'),
  PhonicData(letter: 'r', audioFile: 'r'),
  PhonicData(letter: 's', audioFile: 's'),
  PhonicData(letter: 't', audioFile: 't'),
  PhonicData(letter: 'v', audioFile: 'v'),
  PhonicData(letter: 'w', audioFile: 'w'),
  PhonicData(letter: 'x', audioFile: 'x'),
  PhonicData(letter: 'y', audioFile: 'y'),
  PhonicData(letter: 'z', audioFile: 'z'),
];

final List<PhonicData> vowels = [
  PhonicData(letter: 'a', audioFile: 'a'),
  PhonicData(letter: 'e', audioFile: 'e'),
  PhonicData(letter: 'i', audioFile: 'i'),
  PhonicData(letter: 'o', audioFile: 'o'),
  PhonicData(letter: 'u', audioFile: 'u'),
];
