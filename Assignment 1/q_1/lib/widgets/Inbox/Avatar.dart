import 'dart:math';
import 'EmailTile.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.widget,
  });

  final EmailTile widget;

  @override
  Widget build(BuildContext context) {
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
}
