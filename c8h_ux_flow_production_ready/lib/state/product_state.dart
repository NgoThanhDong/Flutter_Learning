enum UXState {
  initial,     // vừa vào page
  loading,     // load lần đầu (HARD)
  ready,       // có data
  refreshing, // reload nhẹ (SOFT)
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

  bool get isHardLoading => uxState == UXState.loading;
  bool get isSoftLoading => uxState == UXState.refreshing;
  bool get isBusy => isHardLoading || isSoftLoading;
}
