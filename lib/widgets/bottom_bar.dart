import 'package:flutter/material.dart';
import 'package:news_application_ui/modules/active_screen.dart';
import 'package:news_application_ui/modules/discover_screen.dart';
import 'package:news_application_ui/modules/home_screen.dart';

class BottomBarNavigation extends StatelessWidget {
   BottomBarNavigation({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.home),
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(
                right: 50,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ActiveScreen.routeName);
                },
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ),
            label: 'Person'),
      ],
    );
  }
}
