import '../../product/data/datasources/product_datasource.dart';
import '../../product/data/repositories/product_repository_impl.dart';
import '../../product/domain/usecases/load_products.dart';
import '../../product/domain/usecases/refresh_products.dart';
import '../../product/domain/usecases/load_more_products.dart';
import '../../product/presentation/bloc/product_bloc.dart';

ProductBloc createProductBloc() {
  final dataSource = ProductDataSource();
  final repo = ProductRepositoryImpl(dataSource);

  return ProductBloc(
    load: LoadProducts(repo),
    refresh: RefreshProducts(repo),
    loadMore: LoadMoreProducts(repo),
  );
}
