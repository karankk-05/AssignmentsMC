import 'package:flutter/material.dart';
import 'AppDrawerItem.dart';


class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  AppDrawer({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerItem(
                icon: Icons.inbox,
                label: 'Inbox',
                isSelected: selectedIndex == 0,
                onTap: () => onItemTapped(0),
              ),
              DrawerItem(
                icon: Icons.send,
                label: 'Sent',
                isSelected: selectedIndex == 1,
                onTap: () => onItemTapped(1),
              ),
              DrawerItem(
                icon: Icons.drafts,
                label: 'Drafts',
                isSelected: selectedIndex == 2,
                onTap: () => onItemTapped(2),
              ),
              DrawerItem(
                icon: Icons.star,
                label: 'Starred',
                isSelected: selectedIndex == 3,
                onTap: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

