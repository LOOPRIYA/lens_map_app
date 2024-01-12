import 'package:flutter/material.dart';
class choice_button extends StatelessWidget {
  const choice_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: FilledButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xffD9D9D9))),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Я фотограф",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          onPressed: () {}),
    );
  }
}