import '../entities/product.dart';
import '../repositories/product_repository.dart';

class LoadProducts {
  final ProductRepository repo;

  LoadProducts(this.repo);

  Future<List<Product>> call() {
    return repo.load();
  }
}
