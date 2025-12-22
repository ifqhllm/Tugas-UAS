import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/pages/onboarding_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/main_screen.dart';
import 'presentation/pages/splash_screen.dart';
import 'core/constants/colors.dart';
import 'core/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA4ph-7fyVGWw5hrC5XTpmZ1WkZ4a7kcbU',
      authDomain: 'celoe-lms-app.firebaseapp.com',
      projectId: 'celoe-lms-app',
      storageBucket: 'celoe-lms-app.firebasestorage.app',
      messagingSenderId: '411192770586',
      appId:
          '1:411192770586:web:abcdef123456', 
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthProvider _authProvider = AuthProvider();

  @override
  void initState() {
    super.initState();
    _authProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: _authProvider)],
      child: MaterialApp(
        title: 'CeLoe LMS',
        theme: ThemeData(
          primaryColor: AppColors.primaryRed,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/onboarding': (context) => OnboardingPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => MainScreen(),
        },
      ),
    );
  }
}
