import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const LoginTextField({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(12)),
        child: TextField(
          controller: controller,
            textAlign: TextAlign.start,
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: text,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 14))),
      ),
    );
  }
}
