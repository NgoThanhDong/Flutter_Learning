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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.error}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(RetryLoad());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          case ProductStatus.empty:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No products'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(RefreshProducts());
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            );
          case ProductStatus.success:
            return ListView(
              children: state.products
                  .map(
                    (e) => ListTile(
                      title: Text(e),
                      subtitle: const Text('Product description here'),
                      leading: const Icon(Icons.shopping_cart),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  )
                  .toList(),
            );
        }
      },
    );
  }
}
