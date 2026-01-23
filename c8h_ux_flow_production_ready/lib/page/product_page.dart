import 'package:flutter/material.dart';
import '../service/product_service.dart';
import '../state/product_state.dart';
import '../widget/product_view.dart';
import '../widget/loading_overlay.dart';
import '../widget/error_view.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final service = ProductService();

  final ValueNotifier<ProductState> state = ValueNotifier(
    const ProductState(uxState: UXState.initial),
  );

  @override
  void initState() {
    super.initState();
    loadInitial();
  }

  Future<void> loadInitial() async {
    state.value = const ProductState(uxState: UXState.loading);

    try {
      final data = await service.fetchProducts();
      state.value = ProductState(uxState: UXState.ready, products: data);
    } catch (e) {
      state.value = ProductState(uxState: UXState.error, error: e.toString());
    }
  }

  Future<void> refresh() async {
    state.value = ProductState(
      uxState: UXState.refreshing,
      products: state.value.products,
    );

    try {
      final data = await service.fetchProducts();
      data.addAll(['Pomegranate', 'Coconut', 'Dragonfruit']);
      state.value = ProductState(uxState: UXState.ready, products: data);
    } catch (_) {
      state.value = ProductState(
        uxState: UXState.ready,
        products: state.value.products,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProductState>(
      valueListenable: state,
      builder: (_, s, _) {
        return PopScope(
          canPop: !s.isHardLoading,
          child: Scaffold(
            appBar: AppBar(title: const Text('Products')),
            body: Stack(
              children: [
                if (s.uxState == UXState.error)
                  ErrorView(message: s.error ?? 'Error', onRetry: loadInitial)
                else if (s.uxState != UXState.loading)
                  ProductView(state: s, onRefresh: refresh),

                if (s.isHardLoading)
                  const AbsorbPointer(child: LoadingOverlay()),
              ],
            ),
          ),
        );
      },
    );
  }
}
