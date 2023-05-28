// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search Venue Here...."),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
