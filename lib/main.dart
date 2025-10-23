import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/main_page.dart';

void main() {
  runApp(const TujuweApp());
}

class TujuweApp extends StatelessWidget {
  const TujuweApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUJUWE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF0D47A1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const MainPage(),
      },
    );
  }
}
