import '../widgets/Inbox/ComposeFloatingAction.dart';
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:q_1/widgets/Inbox/EmailTile.dart';
import '../colors_decorations/decorations.dart';
import '../services/EmailFetchService.dart';


class Inbox extends StatefulWidget {
  final String email;
  final String password;

  Inbox({required this.email, required this.password});

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final TextEditingController searchController = TextEditingController();
  List<MimeMessage> emails = [];
  List<MimeMessage> filteredEmails = [];
  bool isLoading = true; // Loading state to manage progress indicator

  @override
  void initState() {
    super.initState();
    fetchEmails();
    
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchEmails() async {
    final fetchedEmails = await EmailFetchService().fetchEmails(
      imapServerHost: 'qasid.iitk.ac.in', // Replace with your IMAP server host
      imapServerPort: 993, // IMAP over SSL/TLS
      isImapServerSecure: true,
      userName:
          widget.email.replaceAll('@iitk.ac.in', ''), // Replace with your email
      password: widget.password, // Replace with your password
    );

    setState(() {
      emails = fetchedEmails;
      filteredEmails = fetchedEmails;
      isLoading = false; // Set loading to false when emails are fetched
    });
  }

  

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Scaffold(
      floatingActionButton: ComposeFloatingAction(
          email: widget.email,
          password: widget.password), // Use the new FAB widget
      backgroundColor: Theme.of(context).colorScheme.background,
      body: isLoading // Show circular progress indicator if loading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomAppBar(searchController: searchController),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                //   child:
                //       Text('Inbox', style: mytext.headingtext1(fontSize: 15)),
                // ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredEmails.length,
                    itemBuilder: (context, index) {
                      final email = filteredEmails.reversed.toList()[index];
                      if (email.from == null || email.from!.isEmpty) {
                        return Container(); // Return an empty container if no sender
                      }
                      return EmailTile(
                        email: email,
                        sender:
                            email.from!.first.personalName ?? 'Unknown Sender',
                        timestamp:
                            email.decodeDate()?.toLocal().toString() ?? '',
                        subject: email.decodeSubject() ?? 'No Subject',
                        message: email.decodeTextPlainPart() ?? 'No Message',
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
