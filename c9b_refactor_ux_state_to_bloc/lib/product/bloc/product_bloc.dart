import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../service/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;

  ProductBloc(this.service)
      : super(const ProductState(uxState: UXState.loading)) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(
      state.copyWith(
        uxState: UXState.loading,
        errorMessage: null,
      ),
    );
    
    try {
      final products = await service.fetchProducts();
      if (products.isEmpty) {
        emit(
          state.copyWith(
            uxState: UXState.empty,
            products: [],
          ),
        );
      } else {
        emit(
          state.copyWith(
            uxState: UXState.success,
            products: products,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          uxState: UXState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
