class Product {
  final String id;
  final String name;
  final double price;
  final bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.isAvailable,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      isAvailable: map['isAvailable'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price, 'isAvailable': isAvailable};
  }
}
