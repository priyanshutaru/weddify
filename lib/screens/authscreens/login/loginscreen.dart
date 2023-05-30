// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/screens/authscreens/register/registerscreen.dart';
import 'package:weddify/screens/custom_bottombar/custom_bottombar.dart';
import 'package:weddify/screens/home/homescreen.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopText(
                  title: "Welcome Back!",
                  subtitle: "Enter your password and login here"),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "G-Mail",
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: isShowPassword ? Colors.grey : Colors.pink,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "forget password?",
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              PrimaryElevatedButton(
                title: 'Login',
                onPressed: () async {
                  bool isVaildated = loginVaildation(email.text, password.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const CustomBottomBar(), context: context);
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account??",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      "Register Here",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
