// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lens_map_app/view/profile/profile_view.dart';
import 'package:lens_map_app/view/widget/popular_location_card_widget.dart';

LatLng a = const LatLng(59.941335, 30.367267);

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
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              },
              child: const Icon(
                Icons.person,
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
              height: 230,
              color: Colors.grey,
              child: Stack(
                children: [
                  FlutterMap(
                      options: MapOptions(
                        initialCenter: a,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                            markers: [Marker(width: 110, height: 45,point: a, child: Container(
                              width: 90,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.3),
                                color: Colors.white,
                              ),
                              child: const Row(
                                children: [
                                  CircleAvatar(radius: 13,),
                                  SizedBox(width: 4,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text('Мария'),
                                    Text('1100р/час')
                                  ],)
                                ],
                              ),
                            ))]),
                      ])
                ],
              ),
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
          const PopularLocations(),
          const PopularLocations(),
          const PopularLocations(),
          const PopularLocations(),
          const PopularLocations()
        ],
      ),
    );
  }
}
