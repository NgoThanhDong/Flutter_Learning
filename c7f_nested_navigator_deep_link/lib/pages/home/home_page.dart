import 'package:flutter/material.dart';
import 'home_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('➡️ PUSH HomeDetail');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const HomeDetailPage(id: 1),
              ),
            );
          },
          child: const Text('Open Home Detail'),
        ),
      ),
    );
  }
}
