import 'package:flutter/material.dart';

class LinkCheckScreen extends StatefulWidget {
  static const routeName = '/link_check';
  const LinkCheckScreen({super.key});

  @override
  State<LinkCheckScreen> createState() => _LinkCheckScreenState();
}

class _LinkCheckScreenState extends State<LinkCheckScreen> {
  final _controller = TextEditingController();
  String? _result;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
