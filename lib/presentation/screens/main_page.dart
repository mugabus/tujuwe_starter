import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'news/news_screen.dart';
import 'jobs/jobs_screen.dart';
import 'guides/guides_screen.dart';
import 'scholarships/scholarships_screen.dart';
import '../widgets/bottom_navbar.dart';

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
    ScholarshipsScreen(),
  ];

  void _onTap(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavBar(currentIndex: _selectedIndex, onTap: _onTap),
    );
  }
}
