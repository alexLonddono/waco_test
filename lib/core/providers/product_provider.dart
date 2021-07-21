import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:waco_test/core/models/productModel.dart';
import 'package:waco_test/core/services/firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String? _id = '';
  String? _name = '';
  String? _description = '';
  int? _stock = 0;
  int? _price = 0;
  var uuid = Uuid();

  // Getters
  String? get name => _name;
  String? get description => _description;
  int? get stock => _stock;
  int? get price => _price;
  //Stream<List<Product>> get product => firestoreService.getProducts();

  // Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  changeStock(String value) {
    _stock = int.parse(value);
    notifyListeners();
  }

  changePrice(String value) {
    _price = int.parse(value);
    notifyListeners();
  }

  loadValues(Product product) {
    if (product != null) {
      _id = product.id;
      _name = product.name;
      _description = product.description;
      _stock = product.stock;
      _price = product.price;
    } else {
      _id = null;
      _name = null;
      _description = null;
      _stock = null;
      _price = null;
    }
  }

  saveProduct() {
    print(_id);
    if (_id == null) {
      var newProduct = Product(
          name: name,
          description: description,
          stock: stock,
          price: price,
          id: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = Product(
          name: name,
          description: description,
          stock: stock,
          price: price,
          id: uuid.v4());
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String id) {
    firestoreService.removeProduct(id);
  }
}
