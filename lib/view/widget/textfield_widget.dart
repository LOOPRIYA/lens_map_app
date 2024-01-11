import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({super.key});

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
        child: const TextField(
            textAlign: TextAlign.start,
            // style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Введите логин или email",
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 14))),
      ),
    );
  }
}
