import 'package:flutter/material.dart';

class LoginScreenName extends StatelessWidget {
  final String text;

  const LoginScreenName({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}
