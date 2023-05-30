// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/cart_screen/checkout_cart_items/checkout_cart_items.dart';
import 'package:weddify/screens/cart_screen/widget/singlecart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // var qty = 0;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    appProvider.totalPrice().toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Checkout"),
                  onPressed: () {
                    appProvider.clearBuyProduct();
                    appProvider.addBuyProductCartList();
                    appProvider.clearCart();
                    if (appProvider.getBuyProductList.isEmpty) {
                      toastMessage("Cart is empty");
                    } else {
                      Routes.instance
                          .push(widget: CartItemCheckout(), context: context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: appProvider.getCartProductList.isEmpty
          ? Center(
              child: Text(
                "Cart is Empty",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          : ListView.builder(
              itemCount: appProvider.getCartProductList.length,
              itemBuilder: (context, index) {
                return SignleCartItem(
                  singleProduct: appProvider.getCartProductList[index],
                );
              },
            ),
    );
  }
}
