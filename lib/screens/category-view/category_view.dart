import 'package:flutter/material.dart';
import 'package:weddify/firebase_helper/firebasefirestore/firebase_firestore.dart';

import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/models/category/categorymodel.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(widget.categoryModel.name),
      // ),
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const SizedBox(height: kToolbarHeight * 1),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0, right: 12, left: 12, bottom: 12),
                  //   child: Row(
                  //     children: [
                  //       const BackButton(),
                  //       Text(
                  //         widget.categoryModel.name,
                  //         style: const TextStyle(
                  //           fontSize: 18.0,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  productModelList.isEmpty
                      ? const Center(
                          child: Text("Best Product is empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 6,
                                      childAspectRatio: 0.7,
                                      crossAxisCount: 2),
                              itemBuilder: (ctx, index) {
                                ProductModel singleProduct =
                                    productModelList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  singleProduct.image),
                                              fit: BoxFit.fill),
                                        ),
                                        // child: Image.network(
                                        //   singleProduct.image,
                                        //   height: 100,
                                        //   width: 200,
                                        // ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Price:"),
                                          Text(singleProduct.price.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 140,
                                        child: OutlinedButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Book Now",
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
    );
  }
}
