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
      'bit.ly',
      'tinyurl',
      'goo.gl',
      'login',
      'verify',
      'confirm',
      'free',
      'update',
      'secure',
    ];
    bool isSuspicious = suspiciousKeywords.any(
      (k) => host.contains(k) || uri!.path.contains(k),
    );

    setState(() => _result = isSuspicious ? 'مشبوه' : 'آمن');
  }

  @override
  Widget build(BuildContext context) {
    Color colorFor(String res) {
      if (res == 'آمن') return Colors.green;
      if (res == 'مشبوه') return Colors.orange;
      if (res == 'غير صالح') return Colors.red;
      return Colors.grey;
    }

    IconData iconFor(String res) {
      if (res == 'آمن') return Icons.check_circle;
      if (res == 'مشبوه') return Icons.warning;
      if (res == 'غير صالح') return Icons.error_outline;
      return Icons.help_outline;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('فحص الرابط')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'أدخل الرابط هنا',
                prefixIcon: Icon(Icons.link),
                hintText: 'https://example.com',
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _checkLink,
                    child: const Text('فحص'),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('رجوع'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Card(
                color: Colors.grey[50],
                child: ListTile(
                  leading: Icon(iconFor(_result!), color: colorFor(_result!)),
                  title: Text('الحكم: $_result'),
                  subtitle:
                      _result == 'آمن'
                          ? const Text('الرابط يبدو آمناً (تقييم بسيط محلي).')
                          : (_result == 'مشبوه'
                              ? const Text(
                                'الرابط قد يكون مشبوهًا. تجنّب فتحه إن لم تكن متأكدًا.',
                              )
                              : const Text('الرابط غير صالح.')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
