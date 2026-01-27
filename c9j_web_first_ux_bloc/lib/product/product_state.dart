// 3️⃣ product_state.dart – TÌNH TRẠNG NÃO
// 🧠 Điểm rất quan trọng:
//     UXState = trạng thái màn hình
//     isLoadingMore ≠ loading
//       → để load thêm mà không giật UI

enum UXState { loading, success, empty, error }

class ProductState {
  final UXState uxState;
  final List<String> products;
  final bool isLoadingMore;

  ProductState({
    required this.uxState,
    this.products = const [],
    this.isLoadingMore = false,
  });

  ProductState copyWith({
    UXState? uxState,
    List<String>? products,
    bool? isLoadingMore,
  }) {
    return ProductState(
      uxState: uxState ?? this.uxState,
      products: products ?? this.products,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
