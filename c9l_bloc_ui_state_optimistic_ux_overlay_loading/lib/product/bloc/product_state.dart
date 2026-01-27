import '../model/product.dart';

enum UXStatus { initial, loading, success, empty, error }

class ProductState {
  final UXStatus status;
  final List<Product> products;
  final bool isOverlayLoading;
  final String? error;

  ProductState({
    required this.status,
    this.products = const [],
    this.isOverlayLoading = false,
    this.error,
  });

  ProductState copyWith({
    UXStatus? status,
    List<Product>? products,
    bool? isOverlayLoading,
    String? error,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      isOverlayLoading: isOverlayLoading ?? this.isOverlayLoading,
      error: error,
    );
  }
}
