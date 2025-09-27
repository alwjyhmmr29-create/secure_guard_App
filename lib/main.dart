import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/dashboardscreen.dart';
import 'screens/passwordcheckscreen.dart';
import 'screens/linkcheckscreen.dart';
import 'screens/aboutscreen.dart';

void main() {
  runApp(const SecureGuardApp());
}

class SecureGuardApp extends StatelessWidget {
  const SecureGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Guard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey[800],
            side: BorderSide(color: Colors.grey[600]!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/password_check': (_) => const PasswordCheckScreen(),
        '/link_check': (_) => const LinkCheckScreen(),
        '/about': (_) => const AboutScreen(),
      },
    );
  }
}
