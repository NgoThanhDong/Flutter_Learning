import 'package:flutter/material.dart';
import '../service/product_service.dart';
import '../state/product_state.dart';
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

    stateNotifier =
        ValueNotifier(ProductState(uxState: UXState.loading));

    loadProducts();
  }

  Future<void> loadProducts() async {
    stateNotifier.value =
        ProductState(uxState: UXState.loading);

    try {
      final products = await service.fetchProducts();
      stateNotifier.value = products.isEmpty
          ? ProductState(uxState: UXState.empty)
          : ProductState(
              uxState: UXState.success,
              products: products,
            );
    } catch (e) {
      stateNotifier.value = ProductState(
        uxState: UXState.error,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProductState>(
      valueListenable: stateNotifier,
      builder: (context, state, _) {
        return PopScope(
          // 🔑 UX chỉ quyết định "có cho pop không"
          canPop: state.uxState != UXState.loading,

          onPopInvokedWithResult: (didPop, _) {
            if (!didPop && state.uxState == UXState.loading) {
              debugPrint('Back bị chặn vì đang loading');
            }
          },

          child: Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              // ❌ KHÔNG ẩn back nữa
              // Flutter tự xử theo Navigator stack
            ),
            body: ProductView(
              state: state,
              onRetry: loadProducts,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    stateNotifier.dispose();
    super.dispose();
  }
}
