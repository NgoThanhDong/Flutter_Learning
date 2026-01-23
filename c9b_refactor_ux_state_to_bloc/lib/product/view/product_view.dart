import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state.uxState) {
            case UXState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case UXState.empty:
              return const Center(
                child: Text('No products'),
              );
            case UXState.error:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMessage ?? 'Error'),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProductBloc>()
                            .add(LoadProducts());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            case UXState.success:
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(state.products[index]),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
