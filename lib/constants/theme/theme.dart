import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(

  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.pink,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.pink,
      textStyle: TextStyle(
        fontSize: 18,
      ),
    ),
  ),


  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.red),
    ),
  ),

);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);