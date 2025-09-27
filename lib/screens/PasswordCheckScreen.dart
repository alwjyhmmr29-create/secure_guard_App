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
