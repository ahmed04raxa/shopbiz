import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServices {
  FirebaseFirestore firebaseFirestoreServices = FirebaseFirestore.instance;
  Future addProduct(
    Map<String, dynamic> productInfoMap, // Collection Data
    String categoryName, // Collection Name
  ) async {
    return await firebaseFirestoreServices
        .collection(categoryName)
        .add(productInfoMap);
  }
}
