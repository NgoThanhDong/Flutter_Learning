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

    stateNotifier = ValueNotifier(ProductState(uxState: UXState.loading));

    loadProducts();
  }

  Future<void> loadProducts() async {
    stateNotifier.value = ProductState(uxState: UXState.loading);

    try {
      final products = await service.fetchProducts();

      if (products.isEmpty) {
        stateNotifier.value = ProductState(uxState: UXState.empty);
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
    return ValueListenableBuilder<ProductState>(
      valueListenable: stateNotifier,
      builder: (context, state, _) {
        return PopScope(
          // ✅ canPop cập nhật theo uxState
          canPop: state.uxState != UXState.loading,

          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && state.uxState == UXState.loading) {
              debugPrint('Back bị chặn vì đang loading');
            }
          },

          child: Scaffold(
            appBar: AppBar(
              title: const Text('Products'),

              // ✅ Loading thì ẩn back, còn lại để Flutter tự xử
              leading: state.uxState == UXState.loading
                  ? const SizedBox.shrink()
                  : null,

              // ✅ DEBUG version – luôn có back
              // leading: IconButton(
              //   icon: const Icon(Icons.arrow_back),
              //   onPressed: () {
              //     Navigator.of(context).maybePop();
              //   },
              // ),
            ),
            body: ProductView(
              stateNotifier: stateNotifier,
              onRetry: loadProducts,
            ),
          ),
        );
      },
    );
  }
}
