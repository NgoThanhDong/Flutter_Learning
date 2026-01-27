import '../../domain/entities/product.dart';

enum UXState { loading, success, empty, error }

class ProductState {
  final UXState uxState;
  final List<Product> products;
  final bool isLoadingMore;

  ProductState({
    required this.uxState,
    this.products = const [],
    this.isLoadingMore = false,
  });

  factory ProductState.loading() =>
      ProductState(uxState: UXState.loading);

  factory ProductState.success(List<Product> products) =>
      ProductState(uxState: UXState.success, products: products);

  factory ProductState.empty() =>
      ProductState(uxState: UXState.empty);

  factory ProductState.error() =>
      ProductState(uxState: UXState.error);

  ProductState copyWith({
    List<Product>? products,
    bool? isLoadingMore,
  }) {
    return ProductState(
      uxState: uxState,
      products: products ?? this.products,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
