// 5️⃣ product_bloc.dart – NÃO CHÍNH
// 🧠 CÁI “CLICK NÃO” Ở ĐÂY
//     Load lần đầu → loading
//     Load thêm → KHÔNG đổi UXState
//     Refresh → reset list
//     Retry → quay về flow chuẩn

import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import 'product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository)
      : super(ProductState(uxState: UXState.loading)) {
    on<LoadInitial>(_onLoadInitial);
    on<RetryLoad>(_onRetry);
    on<RefreshProducts>(_onRefresh);
    on<LoadMore>(_onLoadMore);
  }

  Future<void> _onLoadInitial(
      LoadInitial event, Emitter emit) async {
    emit(ProductState(uxState: UXState.loading));

    try {
      final data = await repository.fetch();

      if (data.isEmpty) {
        emit(ProductState(uxState: UXState.empty));
      } else {
        emit(ProductState(
          uxState: UXState.success,
          products: data,
        ));
      }
    } catch (_) {
      emit(ProductState(uxState: UXState.error));
    }
  }

  Future<void> _onRetry(
      RetryLoad event, Emitter emit) async {
    add(LoadInitial());
  }

  Future<void> _onRefresh(
      RefreshProducts event, Emitter emit) async {
    emit(ProductState(uxState: UXState.loading));

    final data = await repository.fetch(refresh: true);

    emit(ProductState(
      uxState: UXState.success,
      products: data,
    ));
  }

  Future<void> _onLoadMore(
      LoadMore event, Emitter emit) async {
    if (state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final more = await repository.fetch();

    emit(state.copyWith(
      products: [...state.products, ...more],
      isLoadingMore: false,
    ));
  }
}
