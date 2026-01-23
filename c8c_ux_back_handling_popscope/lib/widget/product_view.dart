import 'package:flutter/material.dart';
import '../state/product_state.dart';
import 'loading_view.dart';
import 'empty_view.dart';
import 'error_view.dart';

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
            return const LoadingView();
          case UXState.empty:
            return const EmptyView();
          case UXState.error:
            return ErrorView(onRetry: onRetry);
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
