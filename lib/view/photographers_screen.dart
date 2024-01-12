import 'package:flutter/material.dart';
import 'package:lens_map_app/view/widget/photographer_card_widget.dart';
import 'package:lens_map_app/view/widget/sort_button_widget.dart';

class Photographers extends StatefulWidget {
  const Photographers({super.key});

  @override
  State<Photographers> createState() => _Photographers();
}

class _Photographers extends State<Photographers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1c1d30),
        appBar: AppBar(
          title: const Text(
            "Фотографы",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          toolbarHeight: 61,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 8, right: 8),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            )
          ],
        ),
        // bottomNavigationBar: Container(
        //     decoration: const BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        //     ),
        //     child: Material(
        //       elevation: 0.0,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12)),
        //       child: BottomNavigationBar(
        //         elevation: 0,
        //         backgroundColor: Colors.transparent,
        //         selectedItemColor: Colors.black,
        //         items: const <BottomNavigationBarItem>[
        //           BottomNavigationBarItem(
        //               icon: Icon(Icons.map), label: "Локации"),
        //           BottomNavigationBarItem(
        //               icon: Icon(Icons.people), label: "Фотографы"),
        //           BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Чат"),
        //         ],
        //       ),
        //     )),
        body: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SortButton(),
                SortButton(),
                SortButton(),
                SortButton(),
              ],
            ),
            PhotographerCard(),
            PhotographerCard(),
            PhotographerCard(),
          ],
        ));
  }
}


