class ProductService {
  int callCount = 0;

  Future<List<String>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    callCount++;

    if (callCount == 1) {
      throw Exception('Network error');
    }

    if (callCount == 2) {
      return [];
    }

    return ['Apple', 'Banana', 'Orange', 'Grapes', 'Mango', 'Pineapple', 'Strawberry'];
  }
}
