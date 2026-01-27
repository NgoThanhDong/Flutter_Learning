// 4️⃣ product_repository.dart – GIẢ LẬP SERVER
// 🧒 Hiểu đơn giản:
//     Page 1: 20 item
//     Page sau: 10 item
//     Delay = giả loading

class ProductRepository {
  int page = 0;

  Future<List<String>> fetch({bool refresh = false}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (refresh) {
      page = 0;
    }

    page++;

    if (page == 1) {
      return List.generate(20, (i) => 'Product $i');
    }

    return List.generate(
      10,
      (i) => 'Product ${page * 10 + i}',
    );
  }
}
