import 'package:flutter/material.dart';
import 'package:q_1/colors_decorations/decorations.dart';
import '../services/SendEmailService.dart'; // Import the EmailSender class

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
              
              EmailSender.sendEmail(
                email,
                password,
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
}
