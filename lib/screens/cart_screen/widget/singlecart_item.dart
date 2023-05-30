// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/provider/appprovider.dart';

class SignleCartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SignleCartItem({super.key, required this.singleProduct});

  @override
  State<SignleCartItem> createState() => _SignleCartItemState();
}

class _SignleCartItemState extends State<SignleCartItem> {
  var qty = 1;

  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 150,
                color: Colors.red.withOpacity(0.11),
                child: Image.network(
                  widget.singleProduct.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.singleProduct.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.singleProduct.price.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              if (qty >= 2) {
                                qty--;
                              }
                            });
                            appProvider.updateQty(widget.singleProduct, qty);
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.remove),
                            radius: 15,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          qty.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              qty++;
                            });
                            appProvider.updateQty(widget.singleProduct, qty);
                          },
                          child: CircleAvatar(
                            radius: 15,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              if (!appProvider.getFavouriteProductList
                                  .contains(widget.singleProduct)) {
                                appProvider
                                    .addFavouriteProduct(widget.singleProduct);
                                toastMessage("Added to wishlist");
                              } else {
                                appProvider.removeFavouriteProduct(
                                    widget.singleProduct);
                                toastMessage("Removed to wishlist");
                              }
                            },
                            child: Text(
                              appProvider.getFavouriteProductList
                                      .contains(widget.singleProduct)
                                  ? "Remove to wishlist"
                                  : "Add to wishlist",
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                appProvider
                                    .removeCartProduct(widget.singleProduct);
                                toastMessage(
                                    "Item Removed From Cart Succesfully");
                              },
                              child: CircleAvatar(
                                radius: 15,
                                child: Icon(
                                  Icons.delete,
                                  size: 17,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
