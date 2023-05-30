// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/constants/routes/routes.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/screens/authscreens/login/loginscreen.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';
import 'package:weddify/widgets/toptext/toptext.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isShowPassword = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopText(
                      title: "      Register Here",
                      subtitle: "Welcome, Geeks Creat Your First Account"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "E-Mail",
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
                controller: phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                  prefixIcon: Icon(
                    Icons.call,
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
                height: 20,
              ),
              PrimaryElevatedButton(
                title: 'Creat An Account',
                onPressed: () async {
                  bool isVaildated = signUpVaildation(
                      email.text, password.text, name.text, phone.text);
                  if (isVaildated) {
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(name.text, email.text, password.text, context);
                    if (isLogined) {
                      // ignore: use_build_context_synchronously
                      Routes.instance.pushAndRemoveUntil(
                          widget: const LoginScreen(), context: context);
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
                    " I have already an account?",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Login Here",
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
