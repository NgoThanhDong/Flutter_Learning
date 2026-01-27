// 🔟 MAIN – GHÉP LEGO

/*
UI (Presentation)
   ↓
Bloc (Logic)
   ↓
UseCase (Luật chơi)
   ↓
Repository (Hứa hẹn)
   ↓
Datasource (API giả)
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/product/data/datasource/product_remote_datasource.dart';
import 'feature/product/data/repository/product_repository_impl.dart';
import 'feature/product/domain/usecase/get_products.dart';
import 'feature/product/domain/usecase/refresh_products.dart';
import 'feature/product/presentation/bloc/product_bloc.dart';
import 'feature/product/presentation/page/product_page.dart';

void main() {
  final datasource = ProductRemoteDatasource();
  final repository = ProductRepositoryImpl(datasource);

  runApp(
    BlocProvider(
      create: (_) => ProductBloc(
        getProducts: GetProducts(repository),
        refreshProducts: RefreshProducts(repository),
      ),
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
