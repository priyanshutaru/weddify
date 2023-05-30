// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/about_us/about_us.dart';
import 'package:weddify/screens/change_password/change_password.dart';
import 'package:weddify/screens/edit_profile/edit_profile.dart';

import 'package:weddify/screens/fav_screen/fav_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "Profile",
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w300),
                  // ),
                  appProvider.getUserInformation.image == null
                      ?  Icon(
                          Icons.person_outline,
                          size: 120,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                              appProvider.getUserInformation.image!),
                          radius: 60,
                        ),
                  Text(
                    appProvider.getUserInformation.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    appProvider.getUserInformation.email,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Routes.instance
                          .push(widget: const EditProfile(), context: context);
                    },
                    child: Text("Edit Profile"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Your Orders"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance.push(widget: FavScreen(), context: context);
                  },
                  leading: Icon(Icons.favorite_border),
                  title: Text("Favrioute"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance.push(widget: AboutUs(), context: context);
                  },
                  leading: Icon(Icons.accessibility_outlined),
                  title: Text("About Us"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance
                        .push(widget: ChangePassword(), context: context);
                  },
                  leading: Icon(Icons.change_circle_outlined),
                  title: Text("Change Password"),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.support_agent_outlined),
                  title: Text("Support"),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuthHelper.instance.signout();
                    setState(() {});
                  },
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Version 1.0.0"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
