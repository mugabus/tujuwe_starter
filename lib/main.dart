import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/main_page.dart';
import 'screens/details_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF0D47A1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/home': (_) => const MainPage(),
      },
    );
  }
}
