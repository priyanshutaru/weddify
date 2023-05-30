import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebasefirestore/firebase_firestore.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/custom_bottombar/custom_bottombar.dart';
import 'package:weddify/screens/stripehelper/stripehelper.dart';

class CheckoutScreen extends StatefulWidget {
  final ProductModel singleProduct;
  const CheckoutScreen({super.key, required this.singleProduct});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Check-out"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 36.0,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3.0)),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  const Icon(Icons.money),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Cash on Delivery",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 3.0)),
              width: double.infinity,
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  const Icon(Icons.money),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Text(
                    "Pay Online",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Continue"),
                onPressed: () async {
                  appProvider.clearBuyProduct();
                  appProvider.addBuyProduct(widget.singleProduct);

                  if (groupValue == 1) {
                    bool value = await FirebaseFirestoreHelper.instance
                        .uploadOrderedProductFirebase(
                            appProvider.getBuyProductList,
                            context,
                            "Cash on delivery");

                    appProvider.clearBuyProduct();
                    if (value) {
                      Future.delayed(const Duration(seconds: 2), () {
                        Routes.instance.push(
                            widget: const CustomBottomBar(), context: context);
                      });
                    }
                  } else {

                    int value = double.parse(
                            appProvider.totalPriceBuyProductList().toString())
                        .round()
                        .toInt();
                    String totalPrice = (value * 100).toString();
                    await StripeHelper.instance
                        .makePayment(totalPrice.toString(), context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
