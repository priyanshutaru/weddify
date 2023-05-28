import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weddify/constants/theme/theme.dart';
import 'package:weddify/firebase_helper/firebaseauth/firebaseauthhelper.dart';
import 'package:weddify/firebase_helper/firebaseoption/firebaseoption.dart';
import 'package:weddify/provider/appprovider.dart';
import 'package:weddify/screens/home/homescreen.dart';
import 'package:weddify/screens/welcome/welcomescreens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
              return HomeScreen();
            }
            return WelcomeScreen();
          },
        ),
      ),
    );
  }
}
