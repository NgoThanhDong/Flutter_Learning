class ProductDataSource {
  int _page = 0;

  Future<List<String>> fetch({bool refresh = false}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (refresh) {
      _page = 0;
    }

    _page++;

    if (_page == 1) {
      throw Exception('Server error');
    }

    if (_page == 2) {
      return List.generate(20, (i) => 'Product $i');
    }

    return List.generate(
      10,
      (i) => 'Product ${_page * 10 + i}',
    );
  }
}
