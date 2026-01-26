abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}   // vào app
class RetryLoad extends ProductEvent {}      // sau error
class RefreshProducts extends ProductEvent {}// sau empty
