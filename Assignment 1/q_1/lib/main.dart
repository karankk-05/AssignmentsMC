import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'appcolors.dart';
void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail Client',
      theme: appthemes.lighttheme,
      darkTheme: appthemes.darktheme,
      themeMode: ThemeMode.system,
      home: loginpage(),
    );
  }
}

