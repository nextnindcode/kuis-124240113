import 'package:flutter/material.dart';

import 'home.dart';
import 'profile.dart';

class RootScreen extends StatefulWidget {
  final String username;

  const RootScreen({super.key, required this.username});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(username: widget.username),
      ProfileScreen(username: widget.username),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon App'), centerTitle: true),
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
