enum ProductStatus {
  loading,
  success,
  empty,
  error,
}

class ProductState {
  final ProductStatus status;
  final List<String> products;
  final String? error;

  const ProductState({
    required this.status,
    this.products = const [],
    this.error,
  });
}
