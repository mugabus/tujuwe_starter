import 'package:flutter/material.dart';
import 'presentation/theme/app_colors.dart';
import 'presentation/screens/splash/splash_screen.dart';
import 'presentation/screens/main_page.dart';
import 'presentation/state/content_provider.dart';
import 'data/datasources/remote/api_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TujuweApp());
}

class TujuweApp extends StatelessWidget {
  const TujuweApp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContentProvider(api)),
      ],
      child: MaterialApp(
        title: 'TUJUWE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/home': (_) => const MainPage(),
        },
      ),
    );
  }
}
