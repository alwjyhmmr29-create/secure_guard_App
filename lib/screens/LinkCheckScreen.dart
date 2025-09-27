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
  void _checkLink() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      setState(() => _result = 'أدخل رابطًا');
      return;
    }

    Uri? uri;
    try {
      uri = Uri.parse(text);
      if (!uri.hasScheme) uri = Uri.parse('http://$text');
    } catch (e) {
      uri = null;
    }

    if (uri == null || uri.host.isEmpty) {
      setState(() => _result = 'غير صالح');
      return;
    }

    final host = uri.host.toLowerCase();
    final suspiciousKeywords = [
      'bit.ly', 'tinyurl', 'goo.gl', 'login', 'verify',
      'confirm', 'free', 'update', 'secure'
    ];
    bool isSuspicious = suspiciousKeywords.any((k) => host.contains(k) || uri!.path.contains(k));

    setState(() => _result = isSuspicious ? 'مشبوه' : 'آمن');
  }
