import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors_decorations/decorations.dart';
import '../pages/compose.dart';
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

  List<String> details =[
    "The sun dipped below the horizon, painting the sky in hues of orange and pink. A gentle breeze rustled the leaves of the trees, carrying with it the scent of fresh grass and blooming flowers. Birds chirped their evening songs, creating a symphony of nature. In the distance, the sound of a river flowing added to the peaceful ambiance. The world seemed to pause for a moment, basking in the tranquil beauty of twilight. Shadows lengthened and merged, and the first stars began to twinkle in the darkening sky. It was a perfect end to a serene day in the countryside.",
    
    "As the waves crashed against the shore, seagulls soared overhead, their cries echoing in the distance. A lone figure stood on the cliff, watching the endless expanse of the ocean, lost in thought. The salty sea air was refreshing, filling the lungs with every breath. The rhythmic sound of the waves was both calming and powerful, a reminder of the ocean's timeless nature. The sky, painted in shades of blue and gold, reflected on the water's surface, creating a mesmerizing display. It was a place where one could lose track of time, absorbed by the beauty and majesty of the sea.",
    
    "In the heart of the city, skyscrapers towered above, their windows glinting in the afternoon sun. The streets bustled with activity as people hurried to their destinations, creating a symphony of footsteps and chatter. Street vendors called out, selling everything from hot dogs to handcrafted jewelry. Cars honked and buses rumbled by, contributing to the urban soundtrack. Amidst the chaos, a street performer played a soulful tune on his saxophone, providing a moment of serenity. The city's energy was palpable, a blend of ambition, dreams, and the relentless pace of life. It was a place where anything seemed possible.",
    
    "Deep in the forest, a stream gurgled softly, its waters clear and cool. Shafts of sunlight filtered through the canopy, dappling the forest floor with patches of light. Birds flitted from tree to tree, their songs mingling with the rustle of leaves. The air was thick with the scent of pine and damp earth. A deer cautiously approached the stream, dipping its head to drink, its ears twitching at the slightest sound. The forest was a sanctuary, a place where time slowed and the beauty of nature was on full display. It was a reminder of the peace and simplicity that still existed in the world.",
    
    "High in the mountains, snow-capped peaks stretched towards the sky. The air was thin and crisp, carrying with it the sound of birdsong and the distant roar of a waterfall. The landscape was breathtaking, with rugged cliffs, verdant valleys, and pristine lakes. A hiker stood at the summit, taking in the panoramic view, feeling on top of the world. The effort to reach the peak was worth every step, the sense of accomplishment mingling with awe at the natural beauty. It was a place where one could feel both small and immense, a part of something greater than oneself.",
    
    "Amidst the ruins of an ancient civilization, a lone archaeologist sifted through the debris, searching for clues to the past. The sun beat down relentlessly, casting long shadows across the crumbling stones. Each artifact uncovered told a story, a glimpse into a world long gone. The air was filled with the scent of dust and history, a tangible connection to those who had come before. The archaeologist worked meticulously, knowing that each find could be a significant piece of the puzzle. It was a labor of love and dedication, driven by the desire to uncover and understand the mysteries of the past.",
    
    "On the plains, herds of buffalo grazed peacefully, their hooves stirring up clouds of dust. In the distance, a storm brewed on the horizon, its dark clouds a stark contrast against the blue sky. The vast expanse of grassland seemed endless, a testament to the wild and untamed beauty of nature. A cowboy on horseback watched over the herd, his silhouette framed by the setting sun. The air was thick with the scent of earth and rain, an anticipation of the approaching storm. It was a scene of tranquility and raw power, a reminder of the delicate balance between man and nature.",
    
    "In the desert, the sand dunes stretched as far as the eye could see, their shifting shapes mesmerizing in their beauty. The sun beat down mercilessly, casting harsh shadows on the golden landscape. An oasis appeared in the distance, a mirage of lush greenery and cool water. A caravan of camels moved steadily across the sand, their riders wrapped in robes to shield against the heat. The desert was a land of extremes, where survival required resilience and adaptation. Yet, it held a stark beauty, a silence that spoke volumes. It was a place of solitude and reflection, where one could find both challenge and peace.",
    
    "In a bustling marketplace, the air was filled with the vibrant sounds of haggling and laughter. Stalls overflowed with colorful fruits, spices, and textiles, each one a feast for the senses. The aroma of street food wafted through the air, tempting passersby with promises of exotic flavors. Children darted between the stalls, their laughter mingling with the calls of vendors. It was a place of community and commerce, where people from all walks of life came together. The marketplace was alive with energy, a tapestry of sights, sounds, and smells that told the story of the town’s rich culture and history.",
    
    "At the edge of a serene lake, a small cabin sat nestled among the trees. Smoke curled lazily from the chimney, a sign of a warm fire inside. The water was like glass, reflecting the surrounding forest and the clear blue sky. A family gathered on the porch, enjoying the peacefulness of the setting. The children skipped stones across the water while their parents sipped coffee and shared stories. It was a place of respite and connection, a retreat from the hustle and bustle of everyday life. The lake and cabin offered a simple yet profound reminder of the beauty of slowing down and appreciating the moment."
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
                Text('Search in emails',style:mytext.headingtext1(fontSize: 15) ),
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
    floatingActionButton: Align(alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComposeEmailPage()),
                    );
                  },
                  label: Text('Compose',style: TextStyle(color: Theme.of(context).colorScheme.onBackground),),
                  icon: Icon(Icons.edit,color: Theme.of(context).colorScheme.onBackground,),
                ),)),

    backgroundColor: Theme.of(context).colorScheme.background,
    body: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children:[ _appbar(context),
    
    Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Text('Inbox',style:mytext.headingtext1(fontSize: 15), ),
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
              details: details[index]
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
  final String details;

  ProductCard({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachment,
    required this.details
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
              avatar: _avatar(),
              details: widget.details,
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
                        style:mytext.headingbold(fontSize: 15)
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
                      style: mytext.headingbold(fontSize: 12)
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
