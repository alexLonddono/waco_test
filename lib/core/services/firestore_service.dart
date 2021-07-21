import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waco_test/core/models/productModel.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future saveProduct(Product product) {
    return _db.collection('products').doc(product.id).set(product.toMap());
  }

  Stream getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromFirestore(document.data()))
        .toList());
  }

  Future removeProduct(String id) {
    return _db.collection('products').doc(id).delete();
  }
}
