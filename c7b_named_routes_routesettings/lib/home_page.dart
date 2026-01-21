import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 HomePage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            debugPrint('➡️ Navigate to Detail');

            final result = await Navigator.pushNamed(
              context,
              '/detail',
              arguments: 'Apple',
            );

            debugPrint('⬅️ Returned to Home with result: $result');
          },
          child: const Text('Go to Detail'),
        ),
      ),
    );
  }
}
