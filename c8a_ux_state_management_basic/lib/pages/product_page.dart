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
  final ProductService service = ProductService();

  late final ValueNotifier<ProductState> stateNotifier;

  @override
  void initState() {
    super.initState();
    stateNotifier = ValueNotifier(
      ProductState(uxState: UXState.loading),
    );

    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final products = await service.fetchProducts();

      if (products.isEmpty) {
        stateNotifier.value =
            ProductState(uxState: UXState.empty);
      } else {
        stateNotifier.value = ProductState(
          uxState: UXState.success,
          products: products,
        );
      }
    } catch (e) {
      stateNotifier.value = ProductState(
        uxState: UXState.error,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  void dispose() {
    stateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ProductView(
        stateNotifier: stateNotifier,
        onRetry: loadProducts,
      ),
    );
  }
}
