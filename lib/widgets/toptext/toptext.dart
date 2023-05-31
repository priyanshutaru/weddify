// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopText extends StatelessWidget {
  final String title, subtitle;
  const TopText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.kurale(
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
           style: GoogleFonts.kurale(
            //fontSize: 30,
          ),
        ),
      ],
    );
  }
}
