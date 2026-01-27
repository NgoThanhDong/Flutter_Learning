// 2️⃣ product_event.dart – NGƯỜI RA LỆNH
// 🧒 “User chỉ có mấy hành động thôi, đặt tên rõ ràng là được”

abstract class ProductEvent {}

class LoadInitial extends ProductEvent {}

class RetryLoad extends ProductEvent {}

class RefreshProducts extends ProductEvent {}

class LoadMore extends ProductEvent {}
