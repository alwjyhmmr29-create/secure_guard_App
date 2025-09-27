import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String? ?? 'المستخدم';
    return Scaffold(
        appBar: AppBar(
        title: const Text('لوحة التحكم'),
    actions: [
    IconButton(
    icon: const Icon(Icons.info_outline),
    onPressed: () => Navigator.pushNamed(context, '/about'),
    )
    ],
    ),
