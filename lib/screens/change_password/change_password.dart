import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isShowPassword = true;
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: GoogleFonts.kurale(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          TextFormField(
            controller: confirmpassword,
            obscureText: isShowPassword,
            decoration: const InputDecoration(
              hintText: "New Password",
              prefixIcon: Icon(
                Icons.password_sharp,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          TextFormField(
            controller: newpassword,
            obscureText: isShowPassword,
            decoration: InputDecoration(
              hintText: "Confirm Password",
              // hintStyle: GoogleFonts.kurale(
              //   fontSize: 20,
              //   //color: Colors.black,
              // ),
              prefixIcon: const Icon(
                Icons.password_sharp,
              ),
              suffixIcon: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child:  Icon(
                    Icons.visibility,
                    color: isShowPassword ? Colors.grey : Colors.pink,
                  )),
            ),
          ),
          const SizedBox(
            height: 36.0,
          ),
          Container(
            height: 45,
            child: ElevatedButton(
              child: Text(
                "Update",
                style: GoogleFonts.kurale(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                if (newpassword.text.isEmpty) {
                  toastMessage("New Password is empty");
                } else if (confirmpassword.text.isEmpty) {
                  toastMessage("Confirm Password is empty");
                } else if (confirmpassword.text == newpassword.text) {
                  FirebaseAuthHelper.instance
                      .changePassword(newpassword.text, context);
                } else {
                  toastMessage("Confrim Password is not match");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
