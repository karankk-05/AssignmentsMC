import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../colors_decorations/decorations.dart';
import 'dart:math';


class EmailDetailsPage extends StatelessWidget {
  final String sender;
  final String timestamp;
  final String subject;
  final String attachments;
  final Widget avatar;
  final String details;
  EmailDetailsPage({
    required this.sender,
    required this.timestamp,
    required this.subject,
    required this.attachments,
    required this.avatar,
    required this.details
  });


  _subject(){
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( 
            child: Container(
              child: Text(
                '$subject',
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
                softWrap: true, 
                style: mytext.headingtext1(fontSize: 20),
               
              )
            ),
          ),
                 
                ],
              ),
            );
           
  }
  
  

  _sender_details(BuildContext context){
    return Row(
             
              children: <Widget>[
                SizedBox(width: 10,),
              avatar,
              SizedBox(width: 8,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         '$sender',
                        style:mytext.headingtext1(fontSize: 15)
                      ),
                       Text(
                  '$timestamp',
                  style: mytext.headingtext1(fontSize: 11)
                ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()), 
                IconButton(onPressed: null,
         icon: Icon(Icons.reply,color: Theme.of(context).colorScheme.onBackground)),IconButton(onPressed: null,
          icon: Icon(Icons.more_vert,color: Theme.of(context).colorScheme.onBackground)),

               
              ],
            );
  }
  _details(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        child: Text(
          '$details',
          overflow: TextOverflow.ellipsis,
          maxLines: 100,
          softWrap: true, 
          style: mytext.headingtext1(fontSize: 12),
         
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Theme.of(context).colorScheme.background,
     

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
        actions: [Expanded(child: SizedBox()),IconButton(onPressed: null,
         icon: Icon(Icons.delete_rounded,color: Theme.of(context).colorScheme.onBackground)),IconButton(onPressed: null,
          icon: Icon(Icons.mark_email_unread_outlined,color: Theme.of(context).colorScheme.onBackground)),
          IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: Theme.of(context).colorScheme.onBackground))],
      ),



      body: Stack(
        children: [SingleChildScrollView(        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
             _subject(),
             SizedBox(height: 17,),
             _sender_details(context),
             SizedBox(height: 10,),
            _details(context),
            
            
            ],
          ),
          
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
            
              children: [ Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionButton(
                    icon: Icons.reply,
                    label: 'Reply',
                    
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionButton(
                    icon: Icons.reply_all,
                    label: 'Reply All',
                   
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionButton(
                    icon: Icons.forward,
                    label: 'Forward',
                   
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 15,)
        ]
      )
      ]));
  }
}



class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color:Theme.of(context).colorScheme.onBackground ,
            width: 1.0, // Adjust the width of the border as needed
          ),
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          label: Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}