import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;
  static const int limit = 20;

  ProductBloc(this.service) : super(ProductState.initial()) {
    on<LoadFirstPage>(_loadFirst);
    on<LoadNextPage>(_loadNext);
    on<RefreshProducts>(_refresh);
  }

  Future<void> _loadFirst(
      LoadFirstPage event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));

    final products =
        await service.fetchProducts(page: 1, limit: limit);

    emit(
      state.copyWith(
        products: products,
        isLoading: false,
        page: 2,
        hasReachedEnd: products.isEmpty,
      ),
    );
  }

  Future<void> _loadNext(
      LoadNextPage event, Emitter<ProductState> emit) async {
    if (state.isLoading ||
        state.hasReachedEnd ||
        state.isRefreshing) {
      return;
    }

    emit(state.copyWith(isLoading: true));

    final newProducts = await service.fetchProducts(
      page: state.page,
      limit: limit,
    );

    emit(
      state.copyWith(
        products: [...state.products, ...newProducts],
        isLoading: false,
        page: state.page + 1,
        hasReachedEnd: newProducts.isEmpty,
      ),
    );
  }

  Future<void> _refresh(
      RefreshProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isRefreshing: true));

    final products =
        await service.fetchProducts(page: 1, limit: limit);
    
    debugPrint('✅ Refresh done, items: ${products.length}');

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
