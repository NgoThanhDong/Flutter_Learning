// 6️⃣ PRESENTATION – BLOC EVENT
// 🧒 “Con muốn chơi”
// 🧒 “Con muốn thêm đồ”
// 🧒 “Con muốn làm mới”

abstract class ProductEvent {}

class LoadFirstPage extends ProductEvent {}

class LoadNextPage extends ProductEvent {}

class RefreshProductsEvent extends ProductEvent {}
