import 'package:flutter/material.dart';
import 'pages/loginpage.dart';
import 'colors_decorations/appcolors.dart';
import 'pages/homepage.dart';
import 'pages/compose.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // This widget is the root of your application.
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
