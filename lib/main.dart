import 'package:flutter/material.dart';
import 'package:celebratemate/views/onboarding_screen.dart';
import 'package:celebratemate/views/login_screen.dart';
import 'package:celebratemate/views/logo_screen.dart'; // Import the LogoScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CelebrateMate',
      // Set LogoScreen as the initial route
      initialRoute: '/logo',
      routes: {
        '/logo': (context) => LogoScreen(), // Set LogoScreen as the route for '/logo'
        '/onboarding': (context) => OnBoardingScreen(), // Set OnBoardingScreen as the route for '/onboarding'
        '/login': (context) => LoginScreen(), // Set LoginScreen as the route for '/login'
      },
      theme: ThemeData(
        // Set your theme data here
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
