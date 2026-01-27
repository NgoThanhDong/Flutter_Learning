// 2️⃣ DOMAIN – REPOSITORY (LỜI HỨA)
// 🧒 “Tao không biết lấy ở đâu
// 🧒 Nhưng tao HỨA là sẽ trả đồ chơi”
// 📌 UI & Bloc chỉ nói chuyện với cái này

import '../entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({
    required int page,
    required int limit,
  });
}
