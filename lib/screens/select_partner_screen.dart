import 'package:flutter/material.dart';
import '../models/zodiac_sign.dart';
import '../data/zodiac_data.dart';
import '../widgets/zodiac_card.dart';
import 'compatibility_result_screen.dart';

class SelectPartnerScreen extends StatefulWidget {
  final ZodiacSign mySign;

  const SelectPartnerScreen({super.key, required this.mySign});

  @override
  _SelectPartnerScreenState createState() => _SelectPartnerScreenState();
}

class _SelectPartnerScreenState extends State<SelectPartnerScreen> {
  List<ZodiacSign> signs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadSigns();
  }

  Future<void> loadSigns() async {
    final loadedSigns = await loadZodiacSigns();
    setState(() {
      signs = loadedSigns;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Оберіть знак партнера',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(widget.mySign.imageAsset, height: 80, width: 80),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Сумісність для знаку', style: TextStyle(fontSize: 18)),
                    Text(
                      widget.mySign.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: signs.length,
                itemBuilder: (context, index) {
                  final partnerSign = signs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CompatibilityResultScreen(
                            sign1: widget.mySign.name,
                            sign2: partnerSign.name,
                          ),
                        ),
                      );
                    },
                    child: ZodiacCard(sign: partnerSign),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}