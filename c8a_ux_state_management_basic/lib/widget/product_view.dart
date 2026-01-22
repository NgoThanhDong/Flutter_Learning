import 'package:flutter/material.dart';
import '../state/product_state.dart';

class ProductView extends StatelessWidget {
  final ValueNotifier<ProductState> stateNotifier;
  final VoidCallback onRetry;

  const ProductView({
    super.key,
    required this.stateNotifier,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProductState>(
      valueListenable: stateNotifier,
      builder: (context, state, _) {
        switch (state.uxState) {
          case UXState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UXState.empty:
            return const Center(
              child: Text('Chưa có sản phẩm'),
            );
          case UXState.error:
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Có lỗi xảy ra'),
                  ElevatedButton(
                    onPressed: onRetry,
                    child: const Text('Thử lại'),
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
    );
  }
}
