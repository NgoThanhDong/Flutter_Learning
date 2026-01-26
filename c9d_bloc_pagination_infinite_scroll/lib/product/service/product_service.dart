class ProductService {
  int page = 0;

  Future<List<String>> fetchProducts({required int limit}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (page >= 3) {
      return [];
    }

    page++;

    return List.generate(
      limit,
      (index) => 'Product ${(page - 1) * limit + index + 1}',
    );
  }
}
