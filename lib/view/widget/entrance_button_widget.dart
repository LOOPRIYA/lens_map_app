import 'package:flutter/material.dart';
import 'package:lens_map_app/view/locations_screen_view.dart';

class EntranceButton extends StatelessWidget {
  const EntranceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: FilledButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xffD9D9D9))),
          child: const Text(
            "Войти",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Locations())),
        ),
      ),
    );
  }
}
