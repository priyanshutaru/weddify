import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "About Us",
          style: GoogleFonts.kurale(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Weddify is a wedding planner app designed to assist couples in planning their wedding. It provides a wide range of features & help in manges budget, vendores & time, this wedding planner app can simplify the planning process , save time and reduce stress for couples preparing for their wedding.\n It's great solution for the big day.",
          style: GoogleFonts.kurale(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
