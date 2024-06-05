import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
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
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
