import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const CustomTextBtn({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        ));
  }
}
