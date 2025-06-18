import 'package:flutter/material.dart';
import '../data/zodiac_data.dart';
import '../widgets/zodiac_card.dart';
import 'description_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectSignScreen extends StatefulWidget {
  @override
  _SelectSignScreenState createState() => _SelectSignScreenState();
}

class _SelectSignScreenState extends State<SelectSignScreen> {
  late Future<String> _usernameFuture;

  @override
  void initState() {
    super.initState();
    _usernameFuture = _loadUsername();
  }

  Future<String> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _usernameFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final username = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Привіт, $username!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          body: FutureBuilder(
            future: loadZodiacSigns(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final signs = snapshot.data!;
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      'Оберіть свій знак зодіаку',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemCount: signs.length,
                      itemBuilder: (context, index) {
                        final sign = signs[index];
                        return GestureDetector(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DescriptionScreen(sign: sign),
                                ),
                              ),
                          child: ZodiacCard(sign: sign),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
