import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final username =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'المستخدم';
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'مرحبًا، $username',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: Colors.grey[50],
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.security,
                        size: 34,
                        color: Colors.grey[700],
                      ),
                      title: const Text('فحص كلمة المرور'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap:
                          () => Navigator.pushNamed(context, '/password_check'),
                    ),
                  ),
                  Card(
                    color: Colors.grey[50],
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.link,
                        size: 34,
                        color: Colors.grey[700],
                      ),
                      title: const Text('فحص الرابط'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      onTap: () => Navigator.pushNamed(context, '/link_check'),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed:
                  () => Navigator.pushReplacementNamed(context, '/login'),
              icon: const Icon(Icons.logout),
              label: const Text('تسجيل الخروج'),
            ),
          ],
        ),
      ),
    );
  }
}
