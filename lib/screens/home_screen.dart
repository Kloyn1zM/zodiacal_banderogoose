// import 'package:flutter/material.dart';
// import 'description_screen.dart';
// import 'select_partner_screen.dart';
// import '../models/zodiac_sign.dart';

// class HomeScreen extends StatefulWidget {
//   final ZodiacSign selectedSign; // Це mySign

//   const HomeScreen({Key? key, required this.selectedSign}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final screens = [
//       DescriptionScreen(sign: widget.selectedSign),
//       SelectPartnerScreen(mySign: widget.selectedSign), // новий екран
//     ];

//     return Scaffold(
//       body: screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.nights_stay_outlined),
//             label: 'Гороскоп',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Сумісність',
//           ),
//         ],
//       ),
//     );
//   }
// }
