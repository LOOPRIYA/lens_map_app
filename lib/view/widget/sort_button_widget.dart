import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SortButton extends StatelessWidget {
  final String text;
//  final onTap;
  final int type;
  const SortButton({
    super.key, required this.text,
    required this.type,
  //  required this.onTap,
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
          onPressed: () {
            Get.bottomSheet(Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(12),
                    topRight: Radius.circular(12),
                  )
              ),
              child: type == 3 ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Введите желаемую стоимость'
                  ),
                ),
              ) : type == 1 ?const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Введите желаемый стаж'
                  ),
                            ),
              ) : const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Введите желаемую локацию'
                  ),
                ),
              ),
            ));
          },
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
