import 'package:flutter/material.dart';

import 'inbox.dart';
import 'starred.dart';
import 'Sent.dart';
import 'drafts.dart';
import '../widgets/CustomAppBar.dart';

class MainPage extends StatefulWidget {
  final String email;
  final String password;

  MainPage({required this.email, required this.password});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _initializePages();
  }

  void _initializePages() {
    _pages = [
      Inbox(email: widget.email, password: widget.password),
      Sent(),
      Starred(),
      Drafts(),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pop(); // Close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          searchController: TextEditingController()), // Use CustomAppBar here
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerItem(
                  icon: Icons.home,
                  label: 'Inbox',
                  isSelected: _selectedIndex == 0,
                  onTap: () => onItemTapped(0),
                ),
                DrawerItem(
                  icon: Icons.send,
                  label: 'Sent',
                  isSelected: _selectedIndex == 1,
                  onTap: () => onItemTapped(1),
                ),
                DrawerItem(
                  icon: Icons.star,
                  label: 'Starred',
                  isSelected: _selectedIndex == 2,
                  onTap: () => onItemTapped(2),
                ),
                DrawerItem(
                  icon: Icons.drafts,
                  label: 'Drafts',
                  isSelected: _selectedIndex == 3,
                  onTap: () => onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

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
