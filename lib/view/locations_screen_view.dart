import 'package:flutter/material.dart';
import 'package:lens_map_app/view/chats_screen_view.dart';
import 'package:lens_map_app/view/photographers_screen.dart';
import 'package:lens_map_app/view/widget/popular_location_card_widget.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      appBar: AppBar(
        title: const Text(
          "Локации",
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
      body: ListView(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 24),
            child: Container(
              height: 368,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Популярные локации",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
          ),
          PopularLocations(),
          PopularLocations(),
          PopularLocations(),
          PopularLocations(),
          PopularLocations(),
          PopularLocations()
        ],
      ),
    );
  }

}

