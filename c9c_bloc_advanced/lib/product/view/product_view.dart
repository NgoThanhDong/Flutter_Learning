import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ProductStatus.error:
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProductBloc>().add(LoadProducts());
                },
                child: const Text('Retry'),
              ),
            );
          case ProductStatus.empty:
            return const Center(child: Text('No products'));
          case ProductStatus.success:
            return ListView(
              children: state.products
                  .map((e) => ListTile(title: Text(e)))
                  .toList(),
            );
        }
      },
    );
  }
}