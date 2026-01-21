import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  debugPrint('🚀 App started');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 MyApp build');

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
