import 'package:flutter/material.dart';
import 'package:super_cleaner/home.dart';
import 'package:super_cleaner/login.dart';
import 'package:super_cleaner/onboarding.dart';
import 'package:super_cleaner/orders.dart';
import 'package:super_cleaner/register.dart';
import 'package:super_cleaner/services.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String onboardingRoute = '/';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        onboardingRoute: (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/order': (context) => const OrderScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/services': (context) => ServiceSelectionScreen(),   
      },
      initialRoute: onboardingRoute,
    );
  }
}
