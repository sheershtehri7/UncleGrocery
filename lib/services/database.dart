import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future addProduct(
      Map<String, dynamic> addProductMap, String categoryname) async {
    return await FirebaseFirestore.instance
        .collection(categoryname)
        .add(addProductMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String Category) async {
    return await FirebaseFirestore.instance.collection(Category).snapshots();
  }
}
