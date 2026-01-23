enum UXState {
  idle,        // đã load xong, rảnh
  loading,     // đang load
  refreshing,  // reload nhẹ
  error,
}

class ProductState {
  final UXState uxState;
  final List<String> products;
  final String? error;

  const ProductState({
    required this.uxState,
    this.products = const [],
    this.error,
  });

  bool get isBusy => uxState == UXState.loading;
  bool get isSoftBusy => uxState == UXState.refreshing;
}
