import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> load() async {
    final raw = await dataSource.fetch();
    return raw.map((e) => Product(e)).toList();
  }

  @override
  Future<List<Product>> refresh() async {
    final raw = await dataSource.fetch(refresh: true);
    return raw.map((e) => Product(e)).toList();
  }

  @override
  Future<List<Product>> loadMore() async {
    final raw = await dataSource.fetch();
    return raw.map((e) => Product(e)).toList();
  }
}
