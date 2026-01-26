import 'dart:async';
import '../domain/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts({
    required int page,
    required int limit,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    if (page > 3) return []; // giả lập hết data

    return List.generate(limit, (index) {
      final id = (page - 1) * limit + index;
      return Product(id: id, name: 'Product ${id + 1}');
    });
  }
}
