import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChoiceButton extends StatelessWidget {
  final String text;

  const ChoiceButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width / 2 -48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),)),
      ),
    );
  }
}
