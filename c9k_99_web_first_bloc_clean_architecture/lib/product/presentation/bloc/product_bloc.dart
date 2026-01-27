import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../domain/usecases/load_products.dart';
import '../../domain/usecases/refresh_products.dart';
import '../../domain/usecases/load_more_products.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final LoadProducts load;
  final RefreshProducts refresh;
  final LoadMoreProducts loadMore;

  ProductBloc({
    required this.load,
    required this.refresh,
    required this.loadMore,
  }) : super(ProductState.loading()) {
    on<LoadInitial>(_onLoad);
    on<RetryLoad>(_onLoad);
    on<RefreshEvent>(_onRefresh);
    on<LoadMoreEvent>(_onLoadMore);
  }

  Future<void> _onLoad(ProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductState.loading());

    try {
      final data = await load();
      if (data.isEmpty) {
        emit(ProductState.empty());
      } else {
        emit(ProductState.success(data));
      }
    } catch (_) {
      emit(ProductState.error());
    }
  }

  Future<void> _onRefresh(ProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductState.loading());
    final data = await refresh();
    emit(ProductState.success(data));
  }

  Future<void> _onLoadMore(ProductEvent event, Emitter<ProductState> emit) async {
    if (state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));
    final more = await loadMore();

    emit(state.copyWith(
      products: [...state.products, ...more],
      isLoadingMore: false,
    ));
  }
}
