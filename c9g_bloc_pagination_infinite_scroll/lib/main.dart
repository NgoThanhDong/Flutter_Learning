import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/product_service.dart';
import 'presentation/bloc/product_bloc.dart';
import 'presentation/view/product_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ProductBloc(ProductService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}
