import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  /// ------------ Collections Consts -------- ///
  static const users = "users";
  static const banners = "banners";
  static const products = "products";

  static final db = FirebaseFirestore.instance;

  ///------------ Banners Crud jobs -------- ///

  static Future<List<String>> getBanners() async {
    final result = await db.collection(banners).get();
    List<String> bannerImages = [];
    for (var item in result.docs) {
      bannerImages.add(item["image"]);
    }
    return bannerImages;
  }
}
