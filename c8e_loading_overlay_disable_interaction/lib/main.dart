import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🔑 Web chuẩn: dùng route name
      routes: {
        '/': (_) => const HomePage(),
        '/products': (_) => const ProductPage(),
      },
    );
  }
}
