import 'package:flutter/material.dart';
import 'package:zodiacal_banderogoose/screens/description_screen.dart';
import '../models/zodiac_sign.dart';
import '../data/zodiac_data.dart';
import '../data/compatibility_data.dart';

class CompatibilityResultScreen extends StatefulWidget {
  final String sign1;
  final String sign2;

  const CompatibilityResultScreen({
    super.key,
    required this.sign1,
    required this.sign2,
  });

  @override
  State<CompatibilityResultScreen> createState() =>
      _CompatibilityResultScreenState();
}

class _CompatibilityResultScreenState extends State<CompatibilityResultScreen> {
  String _selectedCategory = 'love';
  final List<String> _categories = ['love', 'friendship', 'work'];

  final Map<String, String> _categoryLabels = {
    'love': 'Кохання',
    'friendship': 'Дружба',
    'work': 'Робота',
  };

  List<ZodiacSign>? _zodiacSigns;

  @override
  void initState() {
    super.initState();
    loadZodiacSigns().then((signs) {
      setState(() {
        _zodiacSigns = signs;
      });
    });
  }

  int _getScore(ZodiacSign mySign, ZodiacSign partnerSign) {
    return mySign.compatibilityScores[partnerSign.name]?[_selectedCategory] ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    if (_zodiacSigns == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final mySign = _zodiacSigns!.firstWhere((s) => s.name == widget.sign1);
    final partnerSign = _zodiacSigns!.firstWhere((s) => s.name == widget.sign2);
    final score = _getScore(mySign, partnerSign);
    final description =
        compatibilityDescriptions[_selectedCategory]?[score] ?? 'Невідомо';

    return Scaffold(
      appBar: AppBar(title: const Text('Сумісність')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(mySign.imageAsset, height: 100),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Сумісність для знаку',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            mySign.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(partnerSign.imageAsset, height: 100),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'зі знаком',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            partnerSign.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        _categories.map((category) {
                          final isSelected = _selectedCategory == category;
                          final icon =
                              {
                                'love': Icons.favorite,
                                'friendship': Icons.group,
                                'work': Icons.work,
                              }[category]!;
                          final color =
                              {
                                'love': Colors.pink,
                                'friendship': Colors.green,
                                'work': Colors.orange,
                              }[category]!;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? color.withOpacity(0.2)
                                        : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected ? color : Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    icon,
                                    color: isSelected ? color : Colors.grey,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _categoryLabels[category]!,
                                    style: TextStyle(
                                      color: isSelected ? color : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      'Оцінка: $score',
                      key: ValueKey('score_$_selectedCategory'),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      description,
                      key: ValueKey('desc_$_selectedCategory'),
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DescriptionScreen(sign: mySign),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/images/moon_black.png',
                        height: 32,
                      ),
                      const SizedBox(height: 4),
                      const Text('Гороскоп'),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/images/heart_blue.png',
                        height: 32,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Сумісність',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
