import '../model/product.dart';

class ProductRepository {
  int _callCount = 0;

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    _callCount++;

    if (_callCount == 1) {
      throw Exception('Server error');
    }

    if (_callCount == 2) {
      return [];
    }

    return List.generate(
      20,
      (i) => Product(id: i, name: 'Product ${i + 1}'),
    );
  }
}
