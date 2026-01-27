// 🧒 “Refresh = lấy lại từ đầu”

import '../entity/product.dart';
import '../repository/product_repository.dart';

class RefreshProducts {
  final ProductRepository repository;

  RefreshProducts(this.repository);

  Future<List<Product>> call(int limit) {
    return repository.getProducts(page: 1, limit: limit);
  }
}
