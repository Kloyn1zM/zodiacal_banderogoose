import 'package:flutter/material.dart';
import 'package:zodiacal_banderogoose/screens/login_screen.dart';
import 'package:zodiacal_banderogoose/screens/select_sign_screen.dart';
import 'package:zodiacal_banderogoose/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Зодіакальний Бандерогусь',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => SelectSignScreen(), 
      },
    );
  }
}
