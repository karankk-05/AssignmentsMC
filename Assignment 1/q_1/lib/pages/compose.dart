import 'dart:io';
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:q_1/colors_decorations/decorations.dart';

class ComposeEmailPage extends StatelessWidget {
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final String email;
  final String password;
  ComposeEmailPage({required this.email, required this.password});
  
  @override
  Widget build(BuildContext context) {
    mytext.context=context;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        actions: [
          IconButton(
            onPressed: () { 
              sendEmail(
                recipientController.text,
                subjectController.text,
                bodyController.text,
                context,
              );
            },
            icon: Icon(Icons.send_outlined, color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'To',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              style: mytext.headingtext1(fontSize: 16),
               cursorColor: Colors.white,
              controller: recipientController,
              decoration: InputDecoration(
                hintText: 'Recipient email address',
                
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Subject',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextFormField(style: mytext.headingtext1(fontSize: 15),
              controller: subjectController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Enter subject',
                
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Body',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextFormField(
                style: mytext.headingtext1(fontSize: 15),
                 cursorColor: Colors.white,
                controller: bodyController,
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: 'Compose your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendEmail(String recipient, String subject, String body, BuildContext context) async {
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
