import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

//********************------------- By this the user can upload the image on the firebase  -------------********************//

class FirebaseStorageHelper {
  //static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  static FirebaseStorageHelper instance = FirebaseStorageHelper();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadUserImage(File image) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    TaskSnapshot taskSnapshot = await _storage.ref(userId).putFile(image);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
