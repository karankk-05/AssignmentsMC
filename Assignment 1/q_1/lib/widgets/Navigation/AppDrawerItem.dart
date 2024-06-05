import 'package:flutter/material.dart';
class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? Theme.of(context).colorScheme.onBackground
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onBackground
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
