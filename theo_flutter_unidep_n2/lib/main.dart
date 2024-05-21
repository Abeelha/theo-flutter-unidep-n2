import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clínica Médica',
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: textColor),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
