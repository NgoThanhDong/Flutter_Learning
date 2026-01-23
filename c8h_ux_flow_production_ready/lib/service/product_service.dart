class ProductService {
  Future<List<String>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      'Apple',
      'Banana',
      'Orange',
      'Mango',
      'Pineapple',
      'Strawberry',
      'Lemon',
    ];

    // return []; // test empty
    // throw Exception('Server error'); // test error
  }
}
