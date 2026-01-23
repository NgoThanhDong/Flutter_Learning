import 'package:flutter/material.dart';
import '../state/product_state.dart';

class ProductView extends StatelessWidget {
  final ProductState state;
  final VoidCallback onRetry;

  const ProductView({
    super.key,
    required this.state,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.uxState) {
      case UXState.loading:
        return const SizedBox.shrink();

      case UXState.empty:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('No products'),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        );

      case UXState.error:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.errorMessage ?? 'Error'),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        );

      case UXState.success:
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (_, i) {
            return ListTile(title: Text(state.products[i]));
          },
        );
    }
  }
}
