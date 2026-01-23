class ProductService {
  Future<List<String>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['Apple', 'Banana', 'Orange'];

    // return [];
    // throw Exception('Failed to load products');
  }
}
