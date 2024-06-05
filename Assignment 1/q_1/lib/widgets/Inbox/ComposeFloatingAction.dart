import 'package:flutter/material.dart';
import '../../screens/Compose.dart';

class ComposeFloatingAction extends StatelessWidget {
  final String email;
  final String password;

  ComposeFloatingAction({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
        child: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComposeEmailPage(email: email, password: password),
              ),
            );
          },
          label: Text('Compose', style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
          icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
