import 'package:flutter/material.dart';

import '../../main/start_view_screen.dart';

class EntranceButton extends StatelessWidget {
  const EntranceButton({
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
          child: const Padding(
            padding: EdgeInsets.all(7),
            child: Text(
              "Войти",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Start())),
        ),
      ),
    );
  }
}
