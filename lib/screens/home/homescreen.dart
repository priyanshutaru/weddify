// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/models/bestvenue/bestvenuemodel.dart';
import 'package:weddify/models/category/categorymodel.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController search = TextEditingController();
  List<ProductModel> searchList = [];
  void searchProducts(String value) {
    searchList = bestVenue
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopText(title: "Weddify", subtitle: ""),
                      CupertinoButton(
                        onPressed: () {
                          FirebaseAuthHelper.instance.signout();
                          setState(() {});
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: search,
                          onChanged: (String value) {
                            searchProducts(value);
                          },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search Venue Here...."),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Category",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(e), fit: BoxFit.fill),
                                ),
                                // child: Image.network(
                                //   e,
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Top Rated Venue",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bestVenue.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 6,
                        childAspectRatio: 0.7,
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      ProductModel singleProduct = bestVenue[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.3),
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
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(singleProduct.image),
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   bool isSearched() {
    if (search.text.isNotEmpty && searchList.isEmpty) {
      return true;
    } else if (search.text.isEmpty && searchList.isNotEmpty) {
      return false;
    } else if (searchList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

}

List<String> categories = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKEGPD-BqDJKcnwZ2zgMn99PbPCet_fBrljA",
  "https://wedarranger.com/wed_vendor/upload/couple-5.jpg",
  "https://wedarranger.com/wed_vendor/upload/photo5.jpg",
  "https://wedarranger.com/wed_vendor/upload/bani-caterers-juni-indore-indore-caterers-jigdkdwpe5.webp",
  "https://wedarranger.com/wed_vendor/upload/5e26a669747dc.jpeg",
  "https://wedarranger.com/wed_vendor/upload/cce85b175c0d4aceb9bca82c8ef2542f.jpg",
  "https://wedarranger.com/wed_vendor/upload/Indian-Wedding-Ceremony-Fateh-Garh-Heritage-Resort-2-1920x1280.jpg",
  "https://wedarranger.com/wed_vendor/upload/punjabi-dhol-band-baja-group-reis-magos-goa-wedding-bands-ubal2.jpg",
  "https://image.wedmegood.com/resized/450X/uploads/member/2756868/1676521843_IMG_20230215_WA0006.jpg?crop=0,96,1280,720",
  "https://comfortmytravel.com/wp-content/uploads/2022/12/Mercedes-S-Class.jpeg",
];

// List<CategoryModel> categories = [

//   CategoryModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKEGPD-BqDJKcnwZ2zgMn99PbPCet_fBrljA", id: "1", name: "Venue"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/couple-5.jpg", id: "2", name: "Decore"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/photo5.jpg", id: "3", name: "Photo"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/bani-caterers-juni-indore-indore-caterers-jigdkdwpe5.webp", id: "4", name: "Cater"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/5e26a669747dc.jpeg", id: "5", name: "Make-up"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/cce85b175c0d4aceb9bca82c8ef2542f.jpg", id: "6", name: "Mehandi"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/Indian-Wedding-Ceremony-Fateh-Garh-Heritage-Resort-2-1920x1280.jpg", id: "7", name: "Launge"),
//   CategoryModel(image: "https://wedarranger.com/wed_vendor/upload/punjabi-dhol-band-baja-group-reis-magos-goa-wedding-bands-ubal2.jpg", id: "8", name: "Music"),
//   CategoryModel(image: "https://image.wedmegood.com/resized/450X/uploads/member/2756868/1676521843_IMG_20230215_WA0006.jpg?crop=0,96,1280,720", id: "9", name: "Pandits"),
//   CategoryModel(image: "https://comfortmytravel.com/wp-content/uploads/2022/12/Mercedes-S-Class.jpeg", id: "10", name: "Rental Cars"),

// ];

List<ProductModel> bestVenue = [
  ProductModel(
    image: "https://wedarranger.com/wed_vendor/upload/oceanagrand.jpg",
    id: "1",
    name: "Venue",
    price: 5000000,
    description: "This is venue of the weddify app in major project.",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://wedarranger.com/wed_vendor/upload/unnamed.jpg",
    id: "2",
    name: "Decore",
    price: 100000,
    description: "This is Decore of the weddify app in major project.",
    isFavourite: true,
  ),
  ProductModel(
    image:
        "https://wedarranger.com/wed_vendor/upload/10793873-15759739416176342.jpeg",
    id: "3",
    name: "Photo",
    price: 150000,
    description: "This is Photo of the weddify app in major project.",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://wedarranger.com/wed_vendor/upload/Makeup-by-Asihwarya.jpg",
    id: "4",
    name: "Cater",
    price: 20000,
    description: "This is Cater of the weddify app in major project.",
    isFavourite: true,
  ),
  ProductModel(
    image:
        "https://wedarranger.com/wed_vendor/upload/instagram-mehndi-artists-neeta-sharma.jpg",
    id: "5",
    name: "Make-up",
    price: 50000,
    description: "This is Make-up of the weddify app in major project.",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://wedarranger.com/wed_vendor/upload/indian-wedding-mandap-500x500.jpg",
    id: "6",
    name: "Mehandi",
    price: 10000,
    description: "This is Mahandi of the weddify app in major project.",
    isFavourite: true,
  ),
  ProductModel(
    image:
        "https://wedarranger.com/wed_vendor/upload/food-catering-services-885.jpg",
    id: "7",
    name: "Launge",
    price: 150000,
    description: "This is Launge of the weddify app in major project.",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://wedarranger.com/wed_vendor/upload/wd2-1604312402.jpg",
    id: "8",
    name: "Music",
    price: 10000,
    description: "This is Music of the weddify app in major project.",
    isFavourite: true,
  ),
  ProductModel(
    image: "https://wedarranger.com/wed_vendor/upload/139799-HL_0227.jpeg",
    id: "9",
    name: "Pandit",
    price: 5000,
    description: "This is Pandit of the weddify app in major project.",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGB3XXVqW93NSR8fUq-FRBhzbcNOdSKueHyQ",
    id: "10",
    name: "Rental-Car",
    price: 100000,
    description: "This is Rental-Car of the weddify app in major project.",
    isFavourite: true,
  ),
];
