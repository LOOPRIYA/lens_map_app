import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String text;

  const ChoiceButton({
    super.key,
    required this.text,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),
          onPressed: () {}),
    );
  }
}
