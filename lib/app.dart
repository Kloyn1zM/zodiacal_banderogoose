import 'package:flutter/material.dart';
import 'screens/select_sign_screen.dart';

class ZodiacBanderogooseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Зодіакальний бандерогусь',
      theme: ThemeData(fontFamily: 'SFPro', primarySwatch: Colors.deepPurple),
      home: SelectSignScreen(),
    );
  }
}
