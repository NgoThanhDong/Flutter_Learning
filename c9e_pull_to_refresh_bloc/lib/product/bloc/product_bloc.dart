import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../service/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;

  ProductBloc(this.service) : super(ProductState.loading()) {
    on<LoadProducts>(_onLoad);
    on<RefreshProducts>(_onRefresh);
  }

  Future<void> _onLoad(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductState.loading());

    try {
      final products = await service.fetchProducts();
      emit(ProductState.success(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    final currentProducts = state.products;

    emit(ProductState.refreshing(currentProducts));

    try {
      final products = await service.fetchProducts();
      emit(ProductState.success(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
