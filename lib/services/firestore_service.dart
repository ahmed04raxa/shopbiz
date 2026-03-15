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

  Future addAllProducts(Map<String, dynamic> productInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("Products")
        .add(productInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async {
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }

  Future<QuerySnapshot> search(String updatedName) async {
    return await FirebaseFirestore.instance
        .collection('Products')
        .where(
          "SearchKey",
          isEqualTo: updatedName.substring(0, 1).toUpperCase(),
        )
        .get();
  }
}
