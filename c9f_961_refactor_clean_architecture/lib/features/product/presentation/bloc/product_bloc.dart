import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductState.loading()) {
    on<LoadProducts>(_onLoad);
    on<RefreshProducts>(_onRefresh);
  }

  Future<void> _onLoad(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductState.loading());
    try {
      final products = await getProducts();
      emit(ProductState.success(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> _onRefresh(
      RefreshProducts event, Emitter<ProductState> emit) async {
    emit(ProductState.refreshing(state.products));
    try {
      final products = await getProducts();
      emit(ProductState.success(products));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
