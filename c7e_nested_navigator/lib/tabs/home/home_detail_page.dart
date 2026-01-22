import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('📄 HomeDetailPage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Home Detail')),
      body: const Center(
        child: Text('Detail inside Home tab'),
      ),
    );
  }
}
