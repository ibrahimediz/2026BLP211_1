import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // final CollectionReference _ref = FirebaseFirestore.instance.collection('items');
  final CollectionReference _productsRef = FirebaseFirestore.instance
      .collection('products');
  Future<void> addItem(Map<String, dynamic> data) async {
    await _productsRef.add(data);
  }

  Future<void> deleteItem(String id) async {
    await _productsRef.doc(id).delete();
  }

  Stream<QuerySnapshot> getDataStream() {
    return _productsRef.orderBy('price', descending: false).snapshots();
  }
}
