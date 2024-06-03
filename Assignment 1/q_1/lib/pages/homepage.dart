import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors_decorations/decorations.dart';
import '../pages/compose.dart';
import 'emaildetails.dart';
import 'package:enough_mail/enough_mail.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  final String email;
  final String password;

  Homepage({required this.email, required this.password});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchController = TextEditingController();
  List<MimeMessage> emails = [];
  List<MimeMessage> filteredEmails = [];

  @override
  void initState() {
    super.initState();

    fetchEmails();
    searchController.addListener(_searchEmails);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchEmails() async {
    final fetchedEmails = await imapExample(
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
    });
  }

  Future<List<MimeMessage>> imapExample({
    required String imapServerHost,
    required int imapServerPort,
    required bool isImapServerSecure,
    required String userName,
    required String password,
  }) async {
    final client = ImapClient(isLogEnabled: false);
    List<MimeMessage> fetchedMessages = [];
    try {
      await client.connectToServer(imapServerHost, imapServerPort,
          isSecure: isImapServerSecure);
      await client.login(
          widget.email.replaceAll('@iitk.ac.in', ''), widget.password);
      await client.selectInbox();
      final fetchResult = await client.fetchRecentMessages(
        messageCount: 30,
        criteria: 'BODY.PEEK[]',
      );
      fetchedMessages = fetchResult.messages;
      await client.logout();
    } on ImapException catch (e) {
      print('IMAP failed with $e');
    }
    return fetchedMessages;
  }

  void _searchEmails() {
    String query = searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredEmails = List.from(emails);
      } else {
        filteredEmails = emails.where((email) {
          final from = email.from?.first.personalName?.toLowerCase() ?? '';
          final subject = email.decodeSubject() ?? '';
          final message = email.decodeTextPlainPart() ?? 'No Message';

          return from.contains(query) || subject.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  Widget _appbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        height: 50,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                controller: searchController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                decoration: InputDecoration(
                  hintText: 'Search in emails',
                  hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6)),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: IconButton(
                  onPressed: () {
                    // Implement profile action here
                  },
                  icon: Icon(Icons.person,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
          child: FloatingActionButton.extended(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComposeEmailPage(
                      email: widget.email, password: widget.password),
                ),
              );
            },
            label: Text('Compose',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground)),
            icon: Icon(Icons.edit,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appbar(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text('Inbox', style: mytext.headingtext1(fontSize: 15)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmails.length,
              itemBuilder: (context, index) {
                final email = filteredEmails.reversed.toList()[index];
                if (email.from == null || email.from!.isEmpty) {
                  return Container(); // Return an empty container if no sender
                }
                return ProductCard(
                  email: email,
                  sender: email.from!.first.personalName ?? 'Unknown Sender',
                  timestamp: email.decodeDate()?.toLocal().toString() ?? '',
                  subject: email.decodeSubject() ?? 'No Subject',
                  // attachment: email.attachments.isNotEmpty ? email.attachments.map((a) => a.decodeName()).join('\n') : 'No Attachments',
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

class ProductCard extends StatefulWidget {
  final String sender;
  final String timestamp;
  final String subject;
  final MimeMessage email;
  // final String attachment;
  final String message;

  ProductCard({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.email,
    // required this.attachment,
    required this.message,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isHovered = false;

  Widget _avatar() {
    String initials = widget.sender.substring(0, 1).toUpperCase();
    Random random = Random();
    Color randomColor = Color.fromRGBO(
      random.nextInt(40), // red
      random.nextInt(50), // green
      random.nextInt(200), // blue
      1, // opacity (alpha)
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
      child: Container(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundColor: randomColor,
          child: Text(initials),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      final formatter = DateFormat('d MMMM ', 'en_US');
      return formatter.format(date);
    }
    return '';
  }

  String _formatTime(DateTime? date) {
    if (date != null) {
      final formatter = DateFormat('h:mm a', 'en_US');
      return formatter.format(date);
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    mytext.context = context;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmailDetailsPage(
              sender: widget.sender,
              timestamp: widget.timestamp,
              subject: widget.subject,
              //attachments: widget.attachment,
              avatar: _avatar(),
              message: widget.message,
            ),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Card(
          margin: EdgeInsets.all(8.0),
          color: isHovered
              ? Color.fromARGB(255, 3, 10, 80)
              : Theme.of(context)
                  .colorScheme
                  .background, // Change color when hovered
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _avatar(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sender,
                        style: mytext.headingbold(fontSize: 15),
                      ),
                      SizedBox(
                          height:
                              3), // Adding some space between sender and subject
                      Text(
                        widget.subject,
                        style: mytext.subheadingtext1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width:
                        10), // Adding some space between subject and timestamp
                Column(
                  children: [
                    Text(
                      _formatTime(widget.email.decodeDate()?.toLocal()),
                      style: mytext.headingbold(fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _formatDate(widget.email.decodeDate()?.toLocal()),
                      style: mytext.headingbold(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
