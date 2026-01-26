import 'package:flutter/material.dart';
import 'product/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc Advanced Example',
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}