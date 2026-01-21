import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String message;

  const DetailPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    debugPrint('📄 DetailPage build');

    return PopScope<String>( // 📌 Bắt được: AppBar back, System back, Browser back, Gesture back
      canPop: false, // ⛔ không cho Navigator tự pop
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          debugPrint('⬅️ Already popped with result: $result');
          return;
        }

        debugPrint('⬅️ System/AppBar back detected');
        Navigator.pop(context, 'Back from PopScope');
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // ❗ KHÔNG pop ở đây
              // chỉ trigger back
              Navigator.maybePop(context);
            },
          ),
          /**
            📌 Chỉ bắt được: AppBar back
            ❌ Không bắt được:
              Android system back
              Web browser back
              Gesture back
           */
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context, 'Back from AppBar');
          //   },
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Back with result'),
                onPressed: () {
                  debugPrint('⬅️ Pop DetailPage');
                  Navigator.pop(context, 'Result from Detail');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
