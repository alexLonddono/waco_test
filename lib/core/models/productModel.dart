class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? stock;
  final int? price;

  Product({this.id, this.name, this.description, this.stock, this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stock': stock,
      'price': price
    };
  }

  Product.fromFirestore(Map firestore)
      : id = firestore['id'],
        name = firestore['name'],
        description = firestore['description'],
        stock = firestore['stock'],
        price = firestore['price'];
}
