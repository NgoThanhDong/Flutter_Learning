import '../model/product.dart';

enum ProductStatus {
  loading,
  success,
  error,
  refreshing, // ⭐ QUAN TRỌNG
}

class ProductState {
  final ProductStatus status;
  final List<Product> products;
  final String? error;

  const ProductState({
    required this.status,
    this.products = const [],
    this.error,
  });

  factory ProductState.loading() =>
      const ProductState(status: ProductStatus.loading);

  factory ProductState.success(List<Product> products) =>
      ProductState(
        status: ProductStatus.success,
        products: products,
      );

  factory ProductState.refreshing(List<Product> oldProducts) =>
      ProductState(
        status: ProductStatus.refreshing,
        products: oldProducts, // ⭐ giữ data cũ
      );

  factory ProductState.error(String message) =>
      ProductState(
        status: ProductStatus.error,
        error: message,
      );
}
