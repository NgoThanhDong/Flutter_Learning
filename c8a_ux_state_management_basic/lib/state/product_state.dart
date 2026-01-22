enum UXState {
  loading,
  success,
  empty,
  error,
}

class ProductState {
  final UXState uxState;
  final List<String> products;
  final String? errorMessage;

  ProductState({
    required this.uxState,
    this.products = const [],
    this.errorMessage,
  });
}
