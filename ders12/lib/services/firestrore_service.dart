import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // TODO: Koleksiyon referansı derste tanımlanacak
  // final CollectionReference _ref = FirebaseFirestore.instance.collection('items');

  Future<void> addItem(Map<String, dynamic> data) async {
    // TODO: Firebase ekleme kodu
  }

  Future<void> deleteItem(String id) async {
    // TODO: Firebase silme kodu
  }

  Stream<QuerySnapshot> getDataStream() {
    // TODO: Firebase veri dinleme kodu
    throw UnimplementedError(); // Geçici hata fırlatıcı
  }
}
