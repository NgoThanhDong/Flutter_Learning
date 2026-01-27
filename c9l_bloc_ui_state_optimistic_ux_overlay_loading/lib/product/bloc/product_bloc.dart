import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductState(status: UXStatus.initial)) {
    on<LoadProducts>(_onLoad);
    on<RefreshProducts>(_onRefresh);
  }

  Future<void> _onLoad(LoadProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: UXStatus.loading));

    try {
      final products = await repository.fetchProducts();

      if (products.isEmpty) {
        emit(state.copyWith(status: UXStatus.empty));
      } else {
        emit(state.copyWith(status: UXStatus.success, products: products));
      }
    } catch (e) {
      emit(state.copyWith(status: UXStatus.error, error: e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    // 🔥 điểm mới
    emit(state.copyWith(isOverlayLoading: true));

    try {
      final products = await repository.fetchProducts();

      emit(
        state.copyWith(
          status: products.isEmpty ? UXStatus.empty : UXStatus.success,
          products: products,
          isOverlayLoading: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isOverlayLoading: false));
    }
  }
}
