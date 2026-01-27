abstract class ProductEvent {}

class LoadInitial extends ProductEvent {}
class RetryLoad extends ProductEvent {}
class RefreshEvent extends ProductEvent {}
class LoadMoreEvent extends ProductEvent {}
