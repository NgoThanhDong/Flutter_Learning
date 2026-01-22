import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final int id;

  const HomeDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    debugPrint('📄 HomeDetail build id=$id');

    return Scaffold(
      appBar: AppBar(title: Text('Detail $id')),
      body: Center(child: Text('Home Detail $id')),
    );
  }
}
