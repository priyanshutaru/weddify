import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const PrimaryElevatedButton({super.key,this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(title),
            ),
          );
  }
}