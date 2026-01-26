import '../model/product.dart';

class ProductService {
  int _version = 0;

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    _version++;

    // Mỗi lần refresh → data mới hoàn toàn
    return List.generate(
      20,
      (index) => Product(
        id: index,
        name: 'Product $index (v$_version)',
      ),
    );
  }
}
