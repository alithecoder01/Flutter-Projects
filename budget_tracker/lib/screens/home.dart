import 'package:budget_tracker/pages/home_page.dart';
import 'package:budget_tracker/pages/profile_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NavigationDestination> navigationBottom = const [
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
  ];

  List<Widget> pages = const [home_page(), Profile_page()];

  int _currentPageIndex = 0;

  void pageUpdate(index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  late final ValueChanged<int>? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Money Tracker"),
        //backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      body: pages[_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: navigationBottom,
        onDestinationSelected: (index) => {pageUpdate(index)},
      ),
    );
  }
}
