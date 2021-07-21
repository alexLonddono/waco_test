class Product {
  final String id;
  final String name;
  final String description;
  final int stock;
  final int price;

  Product({this.id, this.name, this.description, this.stock, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        stock: json['stock'],
        price: json['price']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stock': stock,
      'price': price
    };
  }
}
