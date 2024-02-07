import 'package:flutter/material.dart';
class SortButton extends StatelessWidget {
  final String text;
  const SortButton({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: SizedBox(
        height: 23,
        width: MediaQuery.of(context).size.width / 5,
        child: FilledButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xffD9D9D9))),
          onPressed: () {},
          child: FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
