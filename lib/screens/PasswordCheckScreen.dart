import 'package:flutter/material.dart';

class PasswordCheckScreen extends StatefulWidget {
  static const routeName = '/password_check';
  const PasswordCheckScreen({super.key});

  @override
  State<PasswordCheckScreen> createState() => _PasswordCheckScreenState();
}

class _PasswordCheckScreenState extends State<PasswordCheckScreen> {
  final _controller = TextEditingController();
  String? _result;
  void _checkPassword() {
    final p = _controller.text;
    setState(() {
      _result = evaluatePasswordStrength(p);
    });
  }

  String evaluatePasswordStrength(String p) {
    if (p.isEmpty) return 'فارغة';
    int score = 0;
    if (p.length >= 8) score += 2;
    if (p.length >= 12) score += 1;
    if (RegExp(r'[A-Z]').hasMatch(p)) score += 1;
    if (RegExp(r'[0-9]').hasMatch(p)) score += 1;
    if (RegExp(r'[!@#\$%\^&\*(),.?":{}|<>]').hasMatch(p)) score += 2;

    if (score >= 6) return 'قوية';
    if (score >= 4) return 'متوسطة';
    return 'ضعيفة';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
