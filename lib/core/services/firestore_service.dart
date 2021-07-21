import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waco_test/core/models/productModel.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setProduct(Product product) {
    var options = SetOptions(merge: true);

    return _db
        .collection('products')
        .doc(product.id)
        .set(product.toMap(), options);
  }

  //Delete
  Future<void> removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }
}
