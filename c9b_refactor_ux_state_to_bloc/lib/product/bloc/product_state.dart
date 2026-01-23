import 'package:equatable/equatable.dart';

enum UXState {
  loading,
  success,
  empty,
  error,
}

class ProductState extends Equatable {
  final UXState uxState;
  final List<String> products;
  final String? errorMessage;

  const ProductState({
    required this.uxState,
    this.products = const [],
    this.errorMessage,
  });

  ProductState copyWith({
    UXState? uxState,
    List<String>? products,
    String? errorMessage,
  }) {
    return ProductState(
      uxState: uxState ?? this.uxState,
      products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [uxState, products, errorMessage];
}
