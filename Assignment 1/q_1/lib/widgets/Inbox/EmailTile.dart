import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:enough_mail/enough_mail.dart';
import '../../screens/EmailDetails.dart';
import '../../colors_decorations/decorations.dart';
import 'Avatar.dart';

class EmailTile extends StatefulWidget {
  final String sender;
  final String timestamp;
  final String subject;
  final MimeMessage email;
  final String message;

  EmailTile({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.email,
    required this.message,
  });

  @override
  _EmailTileState createState() => _EmailTileState();
}

class _EmailTileState extends State<EmailTile> {
  bool isHovered = false;

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
              avatar: Avatar(widget: widget),
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
              : Theme.of(context).colorScheme.background, // Change color when hovered
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Avatar(widget: widget),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sender,
                        style: mytext.headingbold(fontSize: 15),
                      ),
                      SizedBox(height: 3),
                      Text(
                        widget.subject,
                        style: mytext.subheadingtext1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      _formatTime(widget.email.decodeDate()?.toLocal()),
                      style: mytext.headingbold(fontSize: 12),
                    ),
                    SizedBox(height: 10),
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

