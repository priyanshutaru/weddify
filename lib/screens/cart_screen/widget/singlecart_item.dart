// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          border: Border.all(color: Colors.pink, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 170,
                color: Colors.pink.withOpacity(0.11),
                child: Image.network(
                  widget.singleProduct.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 170,
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
                            style: GoogleFonts.kurale(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            widget.singleProduct.price.toString(),
                            style: GoogleFonts.kurale(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
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
                            backgroundColor: Colors.pink,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
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
                            backgroundColor: Colors.pink,
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
                                toastMessage(
                                  "Added to wishlist",
                                );
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
                              style: GoogleFonts.kurale(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w400,
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
                                backgroundColor: Colors.pink,
                                radius: 15,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
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
