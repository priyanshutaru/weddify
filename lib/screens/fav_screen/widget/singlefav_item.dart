// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/provider/appprovider.dart';

class SingleFavItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavItem({super.key, required this.singleProduct});

  @override
  State<SingleFavItem> createState() => _SingleFavItemState();
}

class _SingleFavItemState extends State<SingleFavItem> {
  var qty = 1;

  @override
  void initState() {
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            style: GoogleFonts.kurale(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.singleProduct.price.toString(),
                            style: GoogleFonts.kurale(
                              //fontSize: 20,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              AppProvider appProvider =
                                  Provider.of<AppProvider>(context,
                                      listen: false);
                              appProvider
                                  .removeFavouriteProduct(widget.singleProduct);
                              toastMessage(
                                  "Item Removed From Fav List Succesfully");
                            },
                            child: Text(
                              "Remove Form Wishlist",
                              style: GoogleFonts.kurale(
                                //fontSize: 20,
                                color: Colors.pink[400],
                              ),
                            ),
                          ),
                          // CupertinoButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {
                          //       AppProvider appProvider =
                          //           Provider.of<AppProvider>(context,
                          //               listen: false);
                          //       appProvider
                          //           .removeCartProduct(widget.singleProduct);
                          //       toastMessage(
                          //           "Item Removed From Cart Succesfully");
                          //     },
                          //     child: CircleAvatar(
                          //       radius: 15,
                          //       child: Icon(
                          //         Icons.delete,
                          //         size: 17,
                          //       ),
                          //     )),
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
