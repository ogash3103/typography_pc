import 'package:flutter/material.dart' hide Typography;
import 'package:typography_pc/screen/form_practice.dart';
import 'package:typography_pc/screen/pitput_practice.dart';
import 'screen/modul_5_s1.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: OtpVerificationPage(),
    );
  }
}
