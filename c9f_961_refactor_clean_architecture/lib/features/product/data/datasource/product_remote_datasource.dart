import '../model/product_model.dart';

class ProductRemoteDataSource {
  int _version = 0;

  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    _version++;

    return List.generate(
      20,
      (index) => ProductModel(
        id: index,
        name: 'Product $index (v$_version)',
      ),
    );
  }
}
