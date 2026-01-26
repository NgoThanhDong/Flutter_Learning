import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'service/product_service.dart';
import 'view/product_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductBloc(ProductService())..add(LoadInitial()),
      child: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: ProductView(),
      ),
    );
  }
}
