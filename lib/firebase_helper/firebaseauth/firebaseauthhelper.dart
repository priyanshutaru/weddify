// ignore_for_file: use_build_context_synchronously, unused_import

//********************-------------These Packages Use Here -------------********************//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/models/usermodel/usermodel.dart';


class FirebaseAuthHelper {
  //********************-------------These are the instances by wich we can access the function in othercalss -------------********************//

  static FirebaseAuthHelper instance = FirebaseAuthHelper();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  //********************-------------User Login Function-------------********************//

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      toastMessage(error.code.toString());
      return false;
    }
  }

  //********************------------- User Sign Up Functin-------------********************//

  Future<bool> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          id: userCredential.user!.uid, name: name, email: email, image: null);

      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      toastMessage(error.code.toString());
      return false;
    }
  }

  //********************-------------Sign-Out Functin-------------********************//

  void signout() async {
    _auth.signOut();
  }

  //********************-------------Chnage password Functin-------------********************//

  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      _auth.currentUser!.updatePassword(password);
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // UserModel userModel = UserModel(
      //     id: userCredential.user!.uid, name: name, email: email, image: null);

      // _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      toastMessage("Password Changed");
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      toastMessage(error.code.toString());
      return false;
    }
  }
}
