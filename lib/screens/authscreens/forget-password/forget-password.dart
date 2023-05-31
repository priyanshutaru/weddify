import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weddify/constants/constantss/constantss.dart';
import 'package:weddify/widgets/button/primaryelevatedbutton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(hintText: 'priyanshutaru@gmail.com'),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 40,
            ),
            PrimaryElevatedButton(
                title: 'Forgot',
                onPressed: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .then((value) {
                    toastMessage(
                        'We have sent you email to recover password, please check email');
                  }).onError((error, stackTrace) {
                    toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
