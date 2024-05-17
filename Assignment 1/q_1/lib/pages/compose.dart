import 'package:flutter/material.dart';
import '../colors_decorations/decorations.dart';
class ComposeEmailPage extends StatelessWidget {
 

  ComposeEmailPage(); 
  @override
  Widget build(BuildContext context) {
  
   
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
         actions: [Expanded(child: SizedBox()),
         IconButton(onPressed: null,
         icon: Icon(Icons.link,color: Theme.of(context).colorScheme.onBackground)),
         IconButton(onPressed: () { 
                   
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      
                      SnackBar(content: Text('Email sent',style:mytext.headingtext1(fontSize: 14),),
                      backgroundColor:Theme.of(context).colorScheme.primaryContainer ,),
                    );
                  },
          icon: Icon(Icons.send_outlined,color: Theme.of(context).colorScheme.onBackground)),
          IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: Theme.of(context).colorScheme.onBackground))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            
            Text(
              'To',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Recipient email address',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Subject',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter subject',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Body',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: TextFormField(
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
