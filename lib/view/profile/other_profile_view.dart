import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProfileView extends GetView {
  const OtherProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
            child: Container(
              height: 100,
              width: Get.width,
              color: Colors.white,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: 200,
                width: Get.width,
                color: Colors.white,
              )),
          ListView(
            children: List.generate(
                6,
                (index) => Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),),
          ),
        ],
      ),
    );
  }
}
