import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomeScreen.build()');

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('➡️ Navigate to /detail');
            context.go('/detail');
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}
