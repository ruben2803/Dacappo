import 'package:dacappo/pages/exercises/exercises_page.dart';
import 'package:dacappo/pages/theory/theory_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    TheoryPage(),
    ExercisesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Theory',
          ),
          NavigationDestination(
            icon: Icon(Icons.queue_music_sharp),
            label: 'Exercises',
          ),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
