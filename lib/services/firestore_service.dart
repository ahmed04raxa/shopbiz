import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Future addProduct(
    Map<String, dynamic> productInfoMap,
    String categoryName,
  ) async {
    return await FirebaseFirestore.instance
        .collection(categoryName)
        .add(productInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async {
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }
}
