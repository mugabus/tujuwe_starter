import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'news_screen.dart';
import 'jobs_screen.dart';
import 'guides_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    NewsScreen(),
    JobsScreen(),
    GuidesScreen(),
  ];

  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: SafeArea(child: _screens[_selectedIndex]),
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: _onTap,
    backgroundColor: Colors.white, // White background
    selectedItemColor: const Color(0xFF0D47A1), // Deep blue active icon
    unselectedItemColor: Colors.blueGrey, // Muted blue-gray inactive icon
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    elevation: 10,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
      BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
      BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Guides'),
    ],
  ),
);

  }
}
