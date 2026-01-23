import 'package:flutter/material.dart';
import '../state/product_state.dart';
import '../service/product_service.dart';
import '../widget/product_view.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final service = ProductService();

  final ValueNotifier<ProductState> state =
      ValueNotifier(const ProductState(uxState: UXState.loading));

  @override
  void initState() {
    super.initState();
    loadInitial();
  }

  Future<void> loadInitial() async {
    state.value = const ProductState(uxState: UXState.loading);

    final data = await service.fetchProducts();

    state.value = ProductState(
      uxState: UXState.idle,
      products: data,
    );
  }

  Future<void> refresh() async {
    state.value = ProductState(
      uxState: UXState.refreshing,
      products: state.value.products,
    );

    final data = await service.fetchProducts();

    state.value = ProductState(
      uxState: UXState.idle,
      products: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProductState>(
      valueListenable: state,
      builder: (_, s, _) {
        return PopScope(
          // ❗ chỉ chặn back khi HARD loading
          canPop: s.uxState != UXState.loading,
          child: Scaffold(
            appBar: AppBar(title: const Text('Products')),
            body: s.uxState == UXState.loading
                ? const Center(child: CircularProgressIndicator())
                : ProductView(
                    state: s,
                    onRefresh: refresh,
                  ),
          ),
        );
      },
    );
  }
}
