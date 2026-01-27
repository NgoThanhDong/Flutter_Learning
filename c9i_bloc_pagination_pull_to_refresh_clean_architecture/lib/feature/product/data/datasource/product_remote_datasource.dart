// 4️⃣ DATA – DATASOURCE (ĐI CHỢ)
// 🧒 “Ra tiệm mua đồ chơi”
// 📌 Đây là chỗ duy nhất biết API

import 'dart:async';
import '../../domain/entity/product.dart';

class ProductRemoteDatasource {
  Future<List<Product>> fetchProducts({
    required int page,
    required int limit,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (page > 3) return [];

    return List.generate(limit, (index) {
      final id = (page - 1) * limit + index;
      return Product(id: id, name: 'Product $id');
    });
  }
}
