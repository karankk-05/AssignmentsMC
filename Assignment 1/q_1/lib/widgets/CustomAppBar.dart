import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;

  CustomAppBar({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 70, 15, 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        height: 50,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                controller: searchController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                decoration: InputDecoration(
                  hintText: 'Search in emails',
                  hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6)),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: IconButton(
                  onPressed: () {
                    // Implement profile action here
                  },
                  icon: Icon(Icons.person,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150); // Define the preferred size
}
