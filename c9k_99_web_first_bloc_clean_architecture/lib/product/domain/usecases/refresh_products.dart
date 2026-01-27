import '../entities/product.dart';
import '../repositories/product_repository.dart';

class RefreshProducts {
  final ProductRepository repo;

  RefreshProducts(this.repo);

  Future<List<Product>> call() {
    return repo.refresh();
  }
}
