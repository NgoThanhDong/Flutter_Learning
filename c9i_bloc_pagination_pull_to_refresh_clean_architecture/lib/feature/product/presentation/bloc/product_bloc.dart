// 8️⃣ PRESENTATION – BLOC (BỘ NÃO)
// 🧒 NÃO NÃO ĐỌC CHI TIẾT – CHỈ NHỚ:
//      Bloc KHÔNG biết API
//      Bloc CHỈ gọi UseCase

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_products.dart';
import '../../domain/usecase/refresh_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final RefreshProducts refreshProducts;

  static const int limit = 20;

  ProductBloc({
    required this.getProducts,
    required this.refreshProducts,
  }) : super(ProductState.initial()) {
    on<LoadFirstPage>(_onLoadFirst);
    on<LoadNextPage>(_onLoadNext);
    on<RefreshProductsEvent>(_onRefresh);
  }

  Future<void> _onLoadFirst(
      LoadFirstPage event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));

    final products = await getProducts(1, limit);

    emit(
      state.copyWith(
        products: products,
        isLoading: false,
        page: 2,
        hasReachedEnd: products.isEmpty,
      ),
    );
  }

  Future<void> _onLoadNext(
      LoadNextPage event, Emitter<ProductState> emit) async {
    if (state.isLoading ||
        state.isRefreshing ||
        state.hasReachedEnd) {
          return;
        }

    emit(state.copyWith(isLoading: true));

    final products =
        await getProducts(state.page, limit);

    emit(
      state.copyWith(
        products: [...state.products, ...products],
        isLoading: false,
        page: state.page + 1,
        hasReachedEnd: products.isEmpty,
      ),
    );
  }

  Future<void> _onRefresh(
      RefreshProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isRefreshing: true));

    final products = await refreshProducts(limit);

    emit(
      state.copyWith(
        products: products,
        isRefreshing: false,
        page: 2,
        hasReachedEnd: products.isEmpty,
      ),
    );
  }
}
