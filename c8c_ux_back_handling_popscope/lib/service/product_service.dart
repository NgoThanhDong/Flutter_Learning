class ProductService {
  Future<List<String>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    // Thử thay đổi return để test UX
    return ['Apple', 'Banana', 'Orange'];

    // return []; // test empty
    // throw Exception('Server error'); // test error
  }
}