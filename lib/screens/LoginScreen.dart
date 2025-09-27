import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: _usernameController.text.trim(),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('تسجيل الدخول')),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Center(
    child: SingleChildScrollView(
    child: Card(
    color: Colors.grey[50],
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
