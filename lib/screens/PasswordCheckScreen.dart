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
  Color _colorFor(String res) {
    if (res == 'قوية') return Colors.green;
    if (res == 'متوسطة') return Colors.orange;
    if (res == 'ضعيفة') return Colors.red;
    return Colors.grey;
  }

  IconData _iconFor(String res) {
    if (res == 'قوية') return Icons.check_circle;
    if (res == 'متوسطة') return Icons.info;
    if (res == 'ضعيفة') return Icons.warning;
    return Icons.help_outline;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('فحص كلمة المرور')),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    TextField(
    controller: _controller,
    obscureText: true,
    decoration: const InputDecoration(
    labelText: 'أدخل كلمة المرور',
    prefixIcon: Icon(Icons.lock),
    ),
    ),
    const SizedBox(height: 12),
    Row(
    children: [
    Expanded(child: ElevatedButton(onPressed: _checkPassword, child: const Text('فحص'))),
    const SizedBox(width: 12),
    OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('رجوع')),
    ],
    ),
    const SizedBox(height: 20),
