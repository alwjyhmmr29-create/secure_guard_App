import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('عن التطبيق')),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Card(
    color: Colors.grey[50],
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text('Secure Guard',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8),
    const Text(
    'تطبيق نموذجي لعرض واجهات فحص كلمات المرور والروابط.',
    style: TextStyle(fontSize: 14),
    ),
    const Divider(height: 24),
    const Text('تصميم المبرمج:',
    style: TextStyle(fontWeight: FontWeight.w600)),
    const SizedBox(height: 6),
    const Text('معمر خالد مهيوب',
    style: TextStyle(fontSize: 16)),
    const SizedBox(height: 8),
    const Text('الهاتف:',
    style: TextStyle(fontWeight: FontWeight.w600)),
    const SizedBox(height: 6),
    const Text('771219211',
    style: TextStyle(fontSize: 16)),
    const SizedBox(height: 12),
