import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> load();
  Future<List<Product>> refresh();
  Future<List<Product>> loadMore();
}
