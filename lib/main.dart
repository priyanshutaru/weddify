// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:weddify/constants/theme/theme.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/firebase_helper/firebaseoption/firebaseoption.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/custom_bottombar/custom_bottombar.dart';
import 'package:weddify/screens/home/homescreen.dart';
import 'package:weddify/screens/welcome/welcomescreens.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
  "pk_test_51MWx8OAVMyklfe3CsjEzA1CiiY0XBTlHYbZ8jQlGtVFIwQi4aNeGv8J1HUw4rgSavMTLzTwgn0XRlwoTVRFXyu2h00mRUeWmAf";
  
  await Firebase.initializeApp(
       options: DefaultFirebaseConfig.platformOptions,
       

      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    // ignore: prefer_const_constructors
    return  ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weddify',
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomBottomBar();
            }
            return WelcomeScreen();
          },
        ),
      ),
    );
  }
}
