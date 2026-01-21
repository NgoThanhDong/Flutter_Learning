import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 📦 Lấy arguments từ RouteSettings
    final args = ModalRoute.of(context)!.settings.arguments as String;

    debugPrint('🟡 DetailPage build, args = $args');

    return PopScope<String>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        debugPrint('⬅️ Back via system/appbar');
        Navigator.pop(context, 'Back from $args');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail of $args'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              debugPrint('⬅️ Back via button');
              Navigator.pop(context, 'Favorite $args');
            },
            child: const Text('Back with result'),
          ),
        ),
      ),
    );
  }
}
