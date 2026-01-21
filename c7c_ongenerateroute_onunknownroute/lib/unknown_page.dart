import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String message;

  const UnknownPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    debugPrint('🚨 UnknownPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page not found'),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
