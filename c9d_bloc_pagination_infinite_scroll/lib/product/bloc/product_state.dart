enum ProductStatus {
  loading,
  success,
  error,
}

class ProductState {
  final ProductStatus status;
  final List<String> products;
  final bool hasReachedEnd;
  final String? error;

  const ProductState({
    required this.status,
    this.products = const [],
    this.hasReachedEnd = false,
    this.error,
  });
}
