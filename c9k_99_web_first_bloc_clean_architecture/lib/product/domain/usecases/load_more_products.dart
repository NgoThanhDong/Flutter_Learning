import '../entities/product.dart';
import '../repositories/product_repository.dart';

class LoadMoreProducts {
  final ProductRepository repo;

  LoadMoreProducts(this.repo);

  Future<List<Product>> call() {
    return repo.loadMore();
  }
}