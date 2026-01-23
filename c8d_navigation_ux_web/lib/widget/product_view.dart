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
        return const Center(child: CircularProgressIndicator());

      case UXState.empty:
        return const Center(child: Text('No products'));

      case UXState.error:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.errorMessage ?? 'Error'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        );

      case UXState.success:
        return ListView(
          children: state.products
              .map((e) => ListTile(title: Text(e)))
              .toList(),
        );
    }
  }
}
