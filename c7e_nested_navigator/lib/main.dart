import 'package:flutter/material.dart';
import 'home_shell_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 MyApp build');

    return const MaterialApp(
      home: HomeShellPage(),
    );
  }
}

