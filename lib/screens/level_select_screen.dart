import 'package:flutter/material.dart';
import 'level1_screen.dart';
import 'level2_screen.dart';
import 'level3_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = <_LevelInfo>[
      _LevelInfo('Level 1', 'Consonant Sounds', (ctx) => const Level1Screen()),
      _LevelInfo('Level 2', 'Vowel Sounds', (ctx) => const Level2Screen()),
      _LevelInfo('Level 3', 'Syllables', (ctx) => const Level3Screen()),
      _LevelInfo('Level 4', 'Word Builder', null),
      _LevelInfo('Level 5', 'Word Sounds', null),
      _LevelInfo('Level 6', 'Vowel Blends', null),
      _LevelInfo('Level 7', 'Starting Blends', null),
      _LevelInfo('Level 8', 'Middle Blends', null),
      _LevelInfo('Level 9', 'Ending Blends', null),
      _LevelInfo('Level 10', 'Digraphs', null),
      _LevelInfo('Level 11', 'Spelling', null),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Level'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];
          final enabled = level.builder != null;
          return GestureDetector(
            onTap: enabled
                ? () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: level.builder!),
                    )
                : null,
            child: Container(
              decoration: BoxDecoration(
                color: enabled ? Colors.orange.shade300 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    level.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: enabled ? Colors.white : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    enabled ? level.subtitle : '${level.subtitle}\n(coming soon)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: enabled ? Colors.white : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LevelInfo {
  final String title;
  final String subtitle;
  final Widget Function(BuildContext)? builder;

  _LevelInfo(this.title, this.subtitle, this.builder);
}
