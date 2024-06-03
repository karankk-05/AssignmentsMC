import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import '../pages/homepage.dart';
import '../colors_decorations/decorations.dart';

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

    // If no exception was thrown, authentication succeeded

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Homepage(
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
