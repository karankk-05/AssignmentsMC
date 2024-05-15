import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'decorations.dart';
import 'emaildetails.dart';
import 'dart:math';
class homepage extends StatelessWidget{



  var sender = [
    "Amitabha Bandyopadhyay",
    "Manindra Agrawal",
    "Ashutosh Sharma",
    "Satish Kumar",
    "Abhay Karandikar",
    "Sandeep Shukla",
    "Kripasindhu Gantait",
    "Amalendu Krishna",
    "Arnab Bhattacharya",
    "Vineet Vashista"
];
List<String> senderInitials = [];
  var timestamp = [
    
  "11:59 PM",
  "10:28 PM",
  "08:10 PM",
  "06:45 PM",
  "04:20 PM",
  "02:55 PM",
  "12:33 PM",
  "10:42 AM",
  "08:15 AM",
  "05:07 AM"
];

  var subject = [
    
    "Computational Physics Tutorial: Problem Set Solutions Available",
    "Advanced Algorithms: Final Exam Schedule and Course Wrap-up",
    "Nanotechnology Lab Project Submission Reminder",
    "Communication Systems: Guest Lecture Announcement",
    "Introduction to Computer Science: Assignment 3 Feedback and Q&A Session",
    "Cybersecurity Seminar Series: Topic Poll and Upcoming Sessions",
    "Machine Learning Workshop: Registration Deadline Extended!",
    "Materials Science Conference: Call for Abstracts and Registration",
    "Biotechnology Symposium: Keynote Speaker Confirmed!",
    "Digital Signal Processing: Office Hours Schedule for Next Week"


  ];

  List<String> attachmentList = [
  'attachment1.pdf',
  'attachment2.jpg\nattachment3.png',
  'attachment4.docx',
  'attachment5.mp4\nattachment6.mov',
  'attachment7.xls',
  'attachment8.pptx\nattachment9.zip',
  'attachment10.txt',
  'attachment11.pdf\nattachment12.docx',
  'attachment13.png',
  'attachment14.mp3\nattachment15.jpg',
];


  Widget _appbar(BuildContext context){
    bool isHovered = false;
    mytext.context = context;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
      child: Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Theme.of(context).colorScheme.primaryContainer),
        height: 50,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [IconButton(onPressed: null, icon: Icon(Icons.menu,color:Theme.of(context).colorScheme.onBackground ,)),
                Text('Search in emails',style:mytext.headingtext1 ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color: Theme.of(context).colorScheme.primaryContainer),
                    child: IconButton(onPressed: null, icon: Icon(Icons.person,color:Theme.of(context).colorScheme.onBackground) ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children:[ _appbar(context),
    
    Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Text('Inbox',style:mytext.headingtext1, ),
    ),
     Expanded(
       child: ListView.builder(
          itemCount:sender.length,
          itemBuilder: (context, index) {
            return ProductCard(
              
              sender: sender[index],
              timestamp: timestamp[index],
              subject: subject[index],
              attachment: attachmentList[index],
            );
          },
        ),
     ),
    ]),
    
  );
}
}



class ProductCard extends StatefulWidget {
  final String sender;
  final String timestamp;
  final String subject;
  final String attachment;

  ProductCard({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachment,
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
      child: Container(width: 40,height: 40,
        
      child: CircleAvatar(
        backgroundColor: randomColor,
        child: Text(initials),
      ),),
    );
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
              attachments: widget.attachment,
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
          color: isHovered ? Color.fromARGB(255, 3, 10, 80) : Theme.of(context).colorScheme.background, // Change color when hovered
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
                        style:mytext.headingtext2
                      ),
                      SizedBox(height: 3), // Adding some space between sender and subject
                      Text(
                        widget.subject,
                        style: mytext.subheadingtext1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Adding some space between subject and timestamp
                Column(
                  children: [
                    Text(
                      widget.timestamp,
                      style: mytext.subheadingtext2
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
