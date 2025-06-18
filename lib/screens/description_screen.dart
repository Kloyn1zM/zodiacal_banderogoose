// description_screen ver 1.1
import 'package:flutter/material.dart';
// import 'package:zodiacal_banderogoose/screens/select_sign_screen.dart';
import '../models/zodiac_sign.dart';
import 'select_partner_screen.dart'; // для переходу на екран сумісності (заміни шлях, якщо інший)

class DescriptionScreen extends StatelessWidget {
  final ZodiacSign sign;

  const DescriptionScreen({Key? key, required this.sign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Всі знаки", style: TextStyle(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(sign.imageAsset, height: 100),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Прогноз для знаку', style: TextStyle(fontSize: 20)),
                      Text(
                        sign.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Дата: ${sign.dateRange}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Text(
              'Опис:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(sign.description, style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            Text(
              sign.quote,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/charmGun.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Зброя-талісман',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(sign.charmGun, style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/luckyNumbers.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Щасливі числа',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(sign.luckyNumbers, style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/horoscope.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(width: 8),
                Text(
                  'Прогноз:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(sign.forecast, style: TextStyle(fontSize: 18)),

            SizedBox(height: 36),

            // --- ДОДАНІ КНОПКИ ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  // onTap: () {
                  //   showDialog(
                  //     context: context,
                  //     builder:
                  //         (_) => AlertDialog(
                  //           title: Text("Гороскоп"),
                  //           content: Text(sign.forecast),
                  //           actions: [
                  //             TextButton(
                  //               onPressed: () => Navigator.pop(context),
                  //               child: Text("Закрити"),
                  //             ),
                  //           ],
                  //         ),
                  //   );
                  // },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/moon_blue.png', // твій PNG для гороскопу
                        width: 32,
                        height: 32,
                      ),
                      SizedBox(height: 4),
                      Text('Гороскоп', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectPartnerScreen(mySign: sign),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/heart_black.png', // твій PNG для сумісності
                        width: 32,
                        height: 32,
                      ),
                      SizedBox(height: 4),
                      Text('Сумісність', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
