import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/product_service.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;

  ProductBloc(this.service)
      : super(const ProductState(status: ProductStatus.loading)) {
    on<LoadProducts>((event, emit) async {
      emit(const ProductState(status: ProductStatus.loading));
      try {
        final products = await service.fetchProducts();
  
        if (products.isEmpty) {
          emit(const ProductState(status: ProductStatus.empty));
        } else {
          emit(ProductState(
            status: ProductStatus.success,
            products: products,
          ));
        }
      } catch (e) {
        emit(ProductState(
          status: ProductStatus.error,
          error: e.toString(),
        ));
      }
    });
  } 
}