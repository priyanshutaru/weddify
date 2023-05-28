// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/assetsimages/images.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/screens/authscreens/login/loginscreen.dart';
import 'package:weddify/screens/authscreens/register/registerscreen.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: kToolbarHeight + 12,
            ),
            TopText(
                title: "Welcome", subtitle: "Complete Your Wedding With Us !"),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                AssetsImages().welcomeImage,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Image.asset(
                    AssetsImages().googleImage,
                    scale: 4.5,
                    //alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 15,
                ),
                CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Image.asset(
                    AssetsImages().facbookImage,
                    scale: 3.6,
                    //alignment: Alignment.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            PrimaryElevatedButton(
              title: "Login",
              onPressed: () {
                Routes.instance.push(
                    widget: LoginScreen(), context: context);
              },
            ),
            SizedBox(
              height: 35,
            ),
            PrimaryElevatedButton(
              title: "Register",
              onPressed: () {
                Routes.instance.push(
                    widget: RegisterScreen(), context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
