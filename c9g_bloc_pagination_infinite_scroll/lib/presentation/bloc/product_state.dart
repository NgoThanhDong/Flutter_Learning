import '../../domain/product.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final bool hasReachedEnd;
  final int page;

  ProductState({
    required this.products,
    required this.isLoading,
    required this.hasReachedEnd,
    required this.page,
  });

  factory ProductState.initial() {
    return ProductState(
      products: [],
      isLoading: false,
      hasReachedEnd: false,
      page: 1,
    );
  }

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? hasReachedEnd,
    int? page,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
    );
  }
}
