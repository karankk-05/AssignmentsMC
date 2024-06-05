import 'dart:io';
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:q_1/colors_decorations/decorations.dart';

class EmailSender {
  static void sendEmail(String email, String password, String recipient, String subject, String body, BuildContext context) async {
    String smtpServerHost = 'smtp.cc.iitk.ac.in';
    int smtpServerPort = 465;
    bool isSmtpServerSecure = true;

    final client = SmtpClient('enough.de', isLogEnabled: true);
    try {
      await client.connectToServer(smtpServerHost, smtpServerPort, isSecure: isSmtpServerSecure);
      await client.ehlo();
      if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
        await client.authenticate(email, password, AuthMechanism.plain);
      } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
        await client.authenticate(email, password, AuthMechanism.login);
      } else {
        return;
      }
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: body,
        htmlText: '<p>${body}</p>',
      )
        ..from = [MailAddress('My name', email)]
        ..to = [MailAddress('Recipient', recipient)]
        ..subject = subject;
      final mimeMessage = builder.buildMimeMessage();
      final sendResponse = await client.sendMessage(mimeMessage);
      if (sendResponse.isOkStatus) {
        SnackBar(backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                content: Text('Email Sent Successfully',style: mytext.headingtext1(fontSize: 16),),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send email.')),
        );
      }
    } on SmtpException catch (e) {
      print('SMTP failed with $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('SMTP failed: $e')),
      );
    } on SocketException catch (e) {
      print('Socket failed with $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Socket error: $e')),
      );
    } catch (e) {
      print('Unexpected error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error: ${e.toString()}')),
      );
    }
  }
}
