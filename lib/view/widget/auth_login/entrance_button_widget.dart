import 'package:flutter/material.dart';
import 'package:lens_map_app/view/auth_login/other_data_freelancer_view.dart';

import '../../main/start_view_screen.dart';

class EntranceButton extends StatelessWidget {
  final String title;
  final onTap;
  const EntranceButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FilledButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xffD9D9D9))),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
