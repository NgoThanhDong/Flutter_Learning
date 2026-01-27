import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product/bloc/product_bloc.dart';
import 'product/bloc/product_event.dart';
import 'product/repository/product_repository.dart';
import 'product/view/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductBloc(ProductRepository())..add(LoadProducts()),
        child: const ProductPage(),
      ),
    );
  }
}
