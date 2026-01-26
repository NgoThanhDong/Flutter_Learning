import 'package:c9f_961_refactor_clean_architecture/features/product/presentation/view/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/product/data/datasource/product_remote_datasource.dart';
import 'features/product/data/repository/product_repository_impl.dart';
import 'features/product/domain/usecase/get_products.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';

void main() {
  final datasource = ProductRemoteDataSource();
  final repository = ProductRepositoryImpl(datasource);
  final getProducts = GetProducts(repository);

  runApp(
    BlocProvider(
      create: (_) => ProductBloc(getProducts)..add(LoadProducts()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductPage(),
      ),
    ),
  );
}
