// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/firebase_helper/firebase-storage/firebase-storage.dart';
import 'package:weddify/firebase_helper/firebasefirestore/firebase_firestore.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/models/usermodel/usermodel.dart';



class AppProvider with ChangeNotifier {
  //// Cart Work
  //********************------------- This is provider statemanagement to manage our app state.  -------------********************//

  final List<ProductModel> _cartProductList = [];
  final List<ProductModel> _buyProductList = [];

  UserModel? _userModel;

  UserModel get getUserInformation => _userModel!;
  

  //********************------------- this state is bascially..when we add the item in cart  -------------********************//


  void addCartProduct(ProductModel productModel) {
    _cartProductList.add(productModel);
    notifyListeners();
  }


//   //********************------------- this state is work bascially..when we remove the item in cart  -------------********************//

  void removeCartProduct(ProductModel productModel) {
    _cartProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getCartProductList => _cartProductList;


//   //********************------------- this state is bascially work on to add faviroute features  -------------********************//
//   ///// Favourite ///////
  final List<ProductModel> _favouriteProductList = [];

  void addFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.add(productModel);
    notifyListeners();
  }

//   //********************------------- this state is bascially work on to remove faviroute features  -------------********************//

  void removeFavouriteProduct(ProductModel productModel) {
    _favouriteProductList.remove(productModel);
    notifyListeners();
  }

  List<ProductModel> get getFavouriteProductList => _favouriteProductList;
 

//   //********************------------- this state is bascially work on to take the information of the user and add it to screen -------------********************//
//   // ////// USer Information
//   // void getUserInfoFirebase() async {
//   //   _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
//   //   notifyListeners();
//   // }

//   // void updateUserInfoFirebase(
//   //     BuildContext context, UserModel userModel, File? file) async {
//   //   if (file == null) {
//   //     showLoaderDialog(context);

//   //     _userModel = userModel;
//   //     await FirebaseFirestore.instance
//   //         .collection("users")
//   //         .doc(_userModel!.id)
//   //         .set(_userModel!.toJson());
//   //     Navigator.of(context, rootNavigator: true).pop();
//   //     Navigator.of(context).pop();
//   //   } else {
//   //     showLoaderDialog(context);

//   //     String imageUrl =
//   //         await FirebaseStorageHelper.instance.uploadUserImage(file);
//   //     _userModel = userModel.copyWith(image: imageUrl);
//   //     await FirebaseFirestore.instance
//   //         .collection("users")
//   //         .doc(_userModel!.id)
//   //         .set(_userModel!.toJson());
//   //     Navigator.of(context, rootNavigator: true).pop();
//   //     Navigator.of(context).pop();
//   //   }
//   //   toastMessage("Successfully updated profile");

//   //   notifyListeners();
//   // }

  void getUserInfoFirebase() async {
    _userModel = await FirebaseFirestoreHelper.instance.getUserInformation();
    notifyListeners();
  }

  void updateUserInfoFirebase(
      BuildContext context, UserModel userModel, File? file) async {
    if (file == null) {
      showLoaderDialog(context);

      _userModel = userModel;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    } else {
      showLoaderDialog(context);

      String imageUrl =
          await FirebaseStorageHelper.instance.uploadUserImage(file);
      _userModel = userModel.copyWith(image: imageUrl);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(_userModel!.id)
          .set(_userModel!.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    }
    toastMessage("Successfully updated profile");

    notifyListeners();
  }


//   //********************------------- this state is bascially work on to add total price of the productes in cart and also at payment screen  -------------********************//
//   // //////// TOTAL PRICE / // / // / / // / / / // /

  double totalPrice() {
    double totalPrice = 0.0;
    for (var element in _cartProductList) {
      totalPrice += element.price * element.qty!;
    }
    return totalPrice;
  }

//   //********************------------- this state is bascially work on to count the total price   -------------********************//

  double totalPriceBuyProductList() {
    double totalPrice = 0.0;
    for (var element in _buyProductList) {
      totalPrice += element.price * element.qty!;
    }
    return totalPrice;
  }

  void updateQty(ProductModel productModel, int qty) {
    int index = _cartProductList.indexOf(productModel);
    _cartProductList[index].qty = qty;
    notifyListeners();
  }

//   //********************------------- this state is bascially work on to add buy product features  -------------********************//
//   // ///////// BUY Product  / / // / / // / / / // /

  void addBuyProduct(ProductModel model) {
    _buyProductList.add(model);
    notifyListeners();
  }

  void addBuyProductCartList() {
    _buyProductList.addAll(_cartProductList);
    notifyListeners();
  }

  void clearCart() {
    _cartProductList.clear();
    notifyListeners();
  }

  void clearBuyProduct() {
    _buyProductList.clear();
    notifyListeners();
  }

  List<ProductModel> get getBuyProductList => _buyProductList;
}
