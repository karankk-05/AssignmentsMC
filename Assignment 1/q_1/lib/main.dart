import 'package:flutter/material.dart';
import 'screens/LoginPage.dart';
import 'colors_decorations/appcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail Client',
      theme: appthemes.lighttheme,
      darkTheme: appthemes.darktheme,
      themeMode: ThemeMode.dark,
      home: loginpage(),
    );
  }
}
