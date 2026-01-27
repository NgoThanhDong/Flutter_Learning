// 5️⃣ DATA – REPOSITORY IMPLEMENT
// 🧒 “Nhận đồ từ tiệm → đưa cho UseCase”
// 📌 Domain không biết datasource tồn tại

import '../../domain/entity/product.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts({
    required int page,
    required int limit,
  }) {
    return datasource.fetchProducts(page: page, limit: limit);
  }
}
