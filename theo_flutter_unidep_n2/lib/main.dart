import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'app_state.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Clínica Médica',
        theme: ThemeData(
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: blackColor),
            bodyText2: TextStyle(color: blackColor),
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
