//compatibility_result_screen 1.0
// import 'package:flutter/material.dart';
// import 'package:zodiacal_banderogoose/screens/description_screen.dart';
// import '../models/zodiac_sign.dart';
// import '../data/zodiac_data.dart';
// import '../data/compatibility_data.dart';

// class CompatibilityResultScreen extends StatelessWidget {
//   final String sign1;
//   final String sign2;
//   final int score;

//   const CompatibilityResultScreen({
//     super.key,
//     required this.sign1,
//     required this.sign2,
//     required this.score,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ZodiacSign>>(
//       future: loadZodiacSigns(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return const Center(child: Text('Помилка завантаження даних'));
//         }

//         if (!snapshot.hasData) {
//           return const Center(child: Text('Немає даних'));
//         }

//         final zodiacSigns = snapshot.data!;
//         final mySign = zodiacSigns.firstWhere((sign) => sign.name == sign1);
//         final partnerSign = zodiacSigns.firstWhere(
//           (sign) => sign.name == sign2,
//         );
//         final description = compatibilityDescriptions[score] ?? 'Невідомо';

//         return Scaffold(
//           appBar: AppBar(title: Text('Сумісність')),
//           body: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       // Верхній рядок з твоїм знаком
//                       Row(
//                         children: [
//                           Image.asset(
//                             mySign.imageAsset,
//                             height: 112,
//                             width: 112,
//                           ),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Сумісність для знаку',
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               Text(
//                                 mySign.name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),

//                       // Нижній рядок з знаком партнера
//                       Row(
//                         children: [
//                           Image.asset(
//                             partnerSign.imageAsset,
//                             height: 112,
//                             width: 112,
//                           ),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('зі знаком', style: TextStyle(fontSize: 18)),
//                               Text(
//                                 partnerSign.name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 64),

//                       Text(
//                         'Ваша сумісність:',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         score.toString(),
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         description,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Кнопки внизу
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 28),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder:
//                                 (context) => DescriptionScreen(sign: mySign),
//                           ),
//                         );
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'lib/assets/images/moon_black.png',
//                             width: 32,
//                             height: 32,
//                           ),
//                           const SizedBox(height: 4),
//                           const Text(
//                             'Гороскоп',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       // Тут можеш пізніше додати повторний вибір
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'lib/assets/images/heart_blue.png',
//                             width: 32,
//                             height: 32,
//                           ),
//                           const SizedBox(height: 4),
//                           const Text(
//                             'Сумісність',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


// SelectPartnerScreen 1.0
// import 'package:flutter/material.dart';
// import '../models/zodiac_sign.dart';
// import '../data/zodiac_data.dart';
// import '../widgets/zodiac_card.dart';
// import 'compatibility_result_screen.dart';

// class SelectPartnerScreen extends StatefulWidget {
//   final ZodiacSign mySign;

//   const SelectPartnerScreen({super.key, required this.mySign});

//   @override
//   _SelectPartnerScreenState createState() => _SelectPartnerScreenState();
// }

// class _SelectPartnerScreenState extends State<SelectPartnerScreen> {
//   List<ZodiacSign> signs = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadSigns();
//   }

//   Future<void> loadSigns() async {
//     final loadedSigns = await loadZodiacSigns();
//     setState(() {
//       signs = loadedSigns;
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Оберіть знак партнера',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Відображення мого знаку з текстом
//             Row(
//               children: [
//                 Image.asset(
//                   widget.mySign.imageAsset, // зображення мого знаку
//                   height: 80,
//                   width: 80,
//                 ),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Сумісність для знаку',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     Text(
//                       widget.mySign.name,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16), // Відступ перед сіткою знаків
//             // Сітка для вибору знаку партнера
//             Expanded(
//               child: GridView.builder(
//                 padding: EdgeInsets.only(top: 4),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 0.8,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: signs.length,
//                 itemBuilder: (context, index) {
//                   final partnerSign = signs[index];
//                   // final score =
//                   //     widget.mySign.compatibilityScores[partnerSign.name] ?? 3;

//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (_) => CompatibilityResultScreen(
//                                 sign1: widget.mySign.name,
//                                 sign2: partnerSign.name,
//                                 // score: score,
//                               ),
//                         ),
//                       );
//                     },
//                     child: ZodiacCard(sign: partnerSign),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Сompatibility screen 2.0
// import 'package:flutter/material.dart';
// import 'package:zodiacal_banderogoose/screens/description_screen.dart';
// import '../models/zodiac_sign.dart';
// import '../data/zodiac_data.dart';
// import '../data/compatibility_data.dart';

// class CompatibilityResultScreen extends StatefulWidget {
//   final String sign1;
//   final String sign2;

//   const CompatibilityResultScreen({
//     super.key,
//     required this.sign1,
//     required this.sign2,
//   });

//   @override
//   State<CompatibilityResultScreen> createState() =>
//       _CompatibilityResultScreenState();
// }

// class _CompatibilityResultScreenState extends State<CompatibilityResultScreen> {
//   String _selectedCategory = 'love';

//   final List<String> _categories = ['love', 'friendship', 'work'];

//   final Map<String, String> _categoryLabels = {
//     'love': 'Кохання',
//     'friendship': 'Дружба',
//     'work': 'Робота',
//   };


//   int _getScore(ZodiacSign mySign, ZodiacSign partnerSign) {
//     return mySign.compatibilityScores[partnerSign.name]?[_selectedCategory] ??
//         0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ZodiacSign>>(
//       future: loadZodiacSigns(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError || !snapshot.hasData) {
//           return const Center(child: Text('Помилка завантаження даних'));
//         }

//         final zodiacSigns = snapshot.data!;
//         final mySign = zodiacSigns.firstWhere((s) => s.name == widget.sign1);
//         final partnerSign = zodiacSigns.firstWhere(
//           (s) => s.name == widget.sign2,
//         );
//         final score = _getScore(mySign, partnerSign);
//         final description = compatibilityDescriptions[score] ?? 'Невідомо';

//         return Scaffold(
//           appBar: AppBar(title: const Text('Сумісність')),
//           body: Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Image.asset(mySign.imageAsset, height: 100),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Сумісність для знаку',
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                               Text(
//                                 mySign.name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           Image.asset(partnerSign.imageAsset, height: 100),
//                           const SizedBox(width: 12),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('зі знаком', style: TextStyle(fontSize: 18)),
//                               Text(
//                                 partnerSign.name,
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 50),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children:
//                             _categories.map((category) {
//                               final isSelected = _selectedCategory == category;

//                               final icon =
//                                   {
//                                     'love': Icons.favorite,
//                                     'friendship': Icons.group,
//                                     'work': Icons.work,
//                                   }[category]!;

//                               final color =
//                                   {
//                                     'love': Colors.pink,
//                                     'friendship': Colors.green,
//                                     'work': Colors.orange,
//                                   }[category]!;

//                               return GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _selectedCategory = category;
//                                   });
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color:
//                                         isSelected
//                                             ? color.withOpacity(0.2)
//                                             : Colors.grey.shade100,
//                                     borderRadius: BorderRadius.circular(12),
//                                     border: Border.all(
//                                       color: isSelected ? color : Colors.grey,
//                                     ),
//                                   ),
//                                   padding: const EdgeInsets.symmetric(
//                                     vertical: 8,
//                                     horizontal: 16,
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Icon(
//                                         icon,
//                                         color: isSelected ? color : Colors.grey,
//                                       ),
//                                       const SizedBox(height: 4),
//                                       Text(
//                                         _categoryLabels[category]!,
//                                         style: TextStyle(
//                                           color:
//                                               isSelected ? color : Colors.grey,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                       ),

//                       const SizedBox(height: 24),
//                       // Text(
//                       //   'Сумісність: ${_categoryLabels[_selectedCategory]}',
//                       //   style: const TextStyle(
//                       //     fontSize: 20,
//                       //     fontWeight: FontWeight.bold,
//                       //   ),
//                       // ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Оцінка: $score',
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         description,
//                         style: const TextStyle(fontSize: 18),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 24),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => DescriptionScreen(sign: mySign),
//                           ),
//                         );
//                       },
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'lib/assets/images/moon_black.png',
//                             height: 32,
//                           ),
//                           const SizedBox(height: 4),
//                           const Text('Гороскоп'),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset(
//                             'lib/assets/images/heart_blue.png',
//                             height: 32,
//                           ),
//                           const SizedBox(height: 4),
//                           const Text(
//                             'Сумісність',
//                             style: TextStyle(color: Colors.blue),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
