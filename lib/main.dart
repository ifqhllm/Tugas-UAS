import 'package:flutter/material.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/login_page.dart';
import 'core/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLoe LMS',
      theme: ThemeData(
        primaryColor: AppColors.primaryRed,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
        useMaterial3: true,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
