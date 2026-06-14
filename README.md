# HATY - Learn to Read

A phonics reading game built with Flutter.

## What's in this version (v1 / MVP)

- Home screen with HATY branding
- Level select screen (showing all 11 planned levels)
- Level 1: Consonant sounds - tap the letter that matches the sound
- Level 2: Vowel sounds - tap the vowel that matches the sound
- Level 3: Syllables - tap the correct consonant AND vowel for a blended sound
- Every letter button speaks its own sound when tapped (using text-to-speech)
- Levels 4-11 are shown as "coming soon" placeholders, ready to be built next

## How sounds work

This version uses the phone's built-in text-to-speech (no audio files needed).
Phonetic sounds are approximated using spelling tricks in
lib/data/phonics_data.dart (e.g. the letter B's sound is written as "buh"
so TTS says it correctly). You can tweak these anytime by editing that file -
no other code needs to change.

## Build with Codemagic

1. Push this repo to GitHub.
2. Connect it to codemagic.io (sign in with GitHub).
3. Codemagic auto-detects codemagic.yaml and builds debug/release APKs and an AAB.
4. Download the APK from the build's Artifacts section and install it on your phone.

## Next steps

- Build out Levels 4-11 using the same pattern as Levels 1-3
- Add pictures for word-based levels (4, 5, 11)
- Replace TTS with recorded audio clips for higher quality sound (optional)
- When ready for the Play Store, use the app-release.aab build artifact
