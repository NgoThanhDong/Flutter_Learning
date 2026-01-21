import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomePage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Detail'),
          onPressed: () async {
            debugPrint('➡️ Push DetailPage');

            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(
                  message: 'Hello from Home',
                ),
              ),
            );

            if (result != null) {
              debugPrint('⬅️ Returned from Detail: $result');
            } else {
              debugPrint('⬅️ User backed without result');
            }
          },
        ),
      ),
    );
  }
}
