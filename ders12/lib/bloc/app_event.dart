abstract class AppEvent {}

class LoadDataEvent extends AppEvent {}

class CreateProductEvent extends AppEvent {
  final Map<String, dynamic> productMap;
  CreateProductEvent(this.productMap);
}

class DeleteProductEvent extends AppEvent {
  final String productId;
  DeleteProductEvent(this.productId);
}
