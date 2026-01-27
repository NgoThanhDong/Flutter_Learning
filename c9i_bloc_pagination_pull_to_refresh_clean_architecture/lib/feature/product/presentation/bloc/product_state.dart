// 7️⃣ PRESENTATION – BLOC STATE
// 🧒 “Não nhớ mình đang chơi tới đâu”

import '../../domain/entity/product.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final bool isRefreshing;
  final bool hasReachedEnd;
  final int page;

  ProductState({
    required this.products,
    required this.isLoading,
    required this.isRefreshing,
    required this.hasReachedEnd,
    required this.page,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      isRefreshing: false,
      hasReachedEnd: false,
      page: 1,
    );
  }

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? isRefreshing,
    bool? hasReachedEnd,
    int? page,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
    );
  }
}
