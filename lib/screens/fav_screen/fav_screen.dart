// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/fav_screen/widget/singlefav_item.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  // var qty = 0;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "My Fav Items",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? Center(
              child: Text(
                "List Is Empty",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          : ListView.builder(
              itemCount: appProvider.getFavouriteProductList.length,
              itemBuilder: (context, index) {
                return SingleFavItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              },
            ),
    );
  }
}
