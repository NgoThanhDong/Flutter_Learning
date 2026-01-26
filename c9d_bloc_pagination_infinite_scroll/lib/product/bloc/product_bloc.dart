import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../service/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;
  static const int limit = 20;

  bool isLoadingMore = false;

  ProductBloc(this.service)
    : super(const ProductState(status: ProductStatus.loading)) {
    on<LoadInitial>(_onLoadInitial);
    on<LoadMore>(_onLoadMore);
  }

  Future<void> _onLoadInitial(
    LoadInitial event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState(status: ProductStatus.loading));

    try {
      final products = await service.fetchProducts(limit: limit);

      emit(
        ProductState(
          status: ProductStatus.success,
          products: products,
          hasReachedEnd: products.isEmpty,
        ),
      );
    } catch (e) {
      emit(ProductState(status: ProductStatus.error, error: e.toString()));
    }
  }

  Future<void> _onLoadMore(LoadMore event, Emitter<ProductState> emit) async {
    if (state.hasReachedEnd || isLoadingMore) return;

    isLoadingMore = true;

    try {
      final more = await service.fetchProducts(limit: limit);

      emit(
        ProductState(
          status: ProductStatus.success,
          products: [...state.products, ...more],
          hasReachedEnd: more.isEmpty,
        ),
      );
    } catch (e) {
      emit(
        ProductState(
          status: ProductStatus.error,
          products: state.products,
          error: e.toString(),
        ),
      );
    }

    isLoadingMore = false;
  }
}
