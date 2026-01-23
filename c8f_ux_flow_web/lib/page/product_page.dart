import 'package:flutter/material.dart';
import '../service/product_service.dart';
import '../state/product_state.dart';
import '../widget/product_view.dart';
import '../widget/loading_overlay.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final service = ProductService();
  final ValueNotifier<ProductState> stateNotifier =
      ValueNotifier(ProductState(uxState: UXState.loading));

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    stateNotifier.value = ProductState(uxState: UXState.loading);

    try {
      final data = await service.fetchProducts();
      stateNotifier.value = data.isEmpty
          ? ProductState(uxState: UXState.empty)
          : ProductState(uxState: UXState.success, products: data);
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
      builder: (_, state, _) {
        final isLoading = state.uxState == UXState.loading;

        return PopScope(
          canPop: !isLoading,
          child: Scaffold(
            appBar: AppBar(title: const Text('Products')),
            body: Stack(
              children: [
                ProductView(state: state, onRetry: load),
                if (isLoading) const AbsorbPointer(child: LoadingOverlay()),
              ],
            ),
          ),
        );
      },
    );
  }
}
