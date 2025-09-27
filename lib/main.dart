import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/password_check_screen.dart';
import 'screens/link_check_screen.dart';
import 'screens/about_screen.dart';
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

