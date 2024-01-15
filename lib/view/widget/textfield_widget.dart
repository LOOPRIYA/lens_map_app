import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String text;
  LoginTextField({super.key, required this.text});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();

}

class _LoginTextFieldState extends State<LoginTextField> {

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
            textAlign: TextAlign.start,
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: widget.text,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 14))),
      ),
    );
  }
}
