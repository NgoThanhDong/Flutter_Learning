import 'package:flutter/material.dart';
import '../state/product_state.dart';

class ProductView extends StatelessWidget {
  final ProductState state;
  final VoidCallback onRefresh;

  const ProductView({
    super.key,
    required this.state,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (state.isSoftBusy)
          const LinearProgressIndicator(),

        for (final item in state.products)
          ListTile(title: Text(item)),

        TextButton(
          onPressed: state.isBusy ? null : onRefresh,
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}
