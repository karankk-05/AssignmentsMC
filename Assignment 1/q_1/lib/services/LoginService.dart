import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:q_1/screens/MainPage.dart';
import '../colors_decorations/decorations.dart';

/// This function handles the login logic
Future<void> login(String email, String password, BuildContext context) async {
  String smtpServerHost = 'smtp.cc.iitk.ac.in';
  int smtpServerPort = 465;
  bool isSmtpServerSecure = true;

  final client = SmtpClient('enough.de', isLogEnabled: true);
  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    await client.ehlo();

    // Attempt authentication
    await client.authenticate(email, password, AuthMechanism.plain);

    // If no exception was thrown, authentication succeeded and naviagate to homepage

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(
          email: email,
          password: password,
        ),
      ),
    );
  } on SmtpException catch (e) {
    // Authentication failed
    print('Authentication failed: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Wrong Username or Email',
          style: kLabelStyle,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  } catch (e) {
    // Handle other exceptions
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Wrong Username or Email',
          style: kLabelStyle,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
