import 'product.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final bool hasReachedEnd;
  final int page;
  final bool isRefreshing;

  ProductState({
    required this.products,
    required this.isLoading,
    required this.hasReachedEnd,
    required this.page,
    required this.isRefreshing,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      hasReachedEnd: false,
      page: 1,
      isRefreshing: false,
    );
  }

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? hasReachedEnd,
    int? page,
    bool? isRefreshing,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
