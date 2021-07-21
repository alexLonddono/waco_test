import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:waco_test/core/models/productModel.dart';
import 'package:waco_test/core/services/firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _id = '';
  String _name = '';
  String _description = '';
  int _stock = 0;
  int _price = 0;
  var uuid = Uuid();

  // Getters
  String get name => _name;
  String get description => _description;
  int get stock => _stock;
  int get price => _price;
  Stream<List<Product>> get product => firestoreService.getProducts();

  // Setters
  set changeName(String value) {
    _name = value;
    notifyListeners();
  }

  set changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  set changeStock(String value) {
    _stock = int.parse(value);
    notifyListeners();
  }

  set changePrice(String value) {
    _price = int.parse(value);
    notifyListeners();
  }

  // Load product
  loadAll(Product product) {
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

  // Add - Update Method
  saveProduct() {
    if (_id == null) {
      // Add
      var newProduct = Product(
          name: _name,
          description: _description,
          stock: _stock,
          price: _price,
          id: uuid.v1());
      firestoreService.setProduct(newProduct);
    } else {
      // Update
      var updatedProduct = Product(
          name: _name,
          description: _description,
          stock: _stock,
          price: _price,
          id: _id);
      firestoreService.setProduct(updatedProduct);
    }
  }

  removeProduct(String id) {
    firestoreService.removeProduct(id);
  }
}
