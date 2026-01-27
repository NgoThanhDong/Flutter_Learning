// 3️⃣ DOMAIN – USE CASE (LUẬT CHƠI)
// 🧒 “Muốn đồ chơi thì phải gọi luật này”
// 📌 UseCase = 1 hành động nghiệp vụ

import '../entity/product.dart';
import '../repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call(int page, int limit) {
    return repository.getProducts(page: page, limit: limit);
  }
}
