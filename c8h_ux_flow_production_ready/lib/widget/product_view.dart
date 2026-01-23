import 'package:flutter/material.dart';
import '../state/product_state.dart';

class ProductView extends StatelessWidget {
  final ProductState state;
  final VoidCallback onRefresh;

  const ProductView({super.key, required this.state, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (state.isSoftLoading) const LinearProgressIndicator(),

        TextButton(
          onPressed: state.isBusy ? null : onRefresh,
          child: const Text(
            'Refresh',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
        ),

        for (final p in state.products)
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(p),
            subtitle: Text('fruit number ${state.products.indexOf(p) + 1}'),
            trailing: const Icon(Icons.chevron_right),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
