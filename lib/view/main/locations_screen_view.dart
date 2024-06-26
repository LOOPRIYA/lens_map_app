// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lens_map_app/controller/services_controller.dart';
import 'package:lens_map_app/view/profile/other_profile_view.dart';
import 'package:lens_map_app/view/profile/profile_view.dart';
import 'package:lens_map_app/view/widget/popular_location_card_widget.dart';

MapController mapController = MapController();

class Locations extends GetView<ServicesController> {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getLocations();
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
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  ),
              child: Container(
                height: 230,
                color: Colors.grey,
                child: Stack(
                  children: [
                    FlutterMap(
                        mapController: mapController,
                        options: const MapOptions(
                          initialCenter: LatLng(55.3, 44.2),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                              markers: List.generate(
                                  controller.locations.length, (index) {
                            var item = controller.locations[index];
                            return Marker(
                              width: 135,
                              height: 45,
                              point: LatLng(double.parse(item['geo_x']),
                                  double.parse(item['geo_y'])),
                              child: MarketContent(
                                userName: item['user_name'],
                                title: item['title'],
                                price: item['price'],
                                id: item['id'],
                                uid: item['uid'],
                                userExp: item['user_experience'],
                              ),
                            );
                          })),
                        ])
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 16, bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Горячие предложения",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 8,
                      spacing: 16,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6)),
                          height: 150,
                          width: 300,
                        ),
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 16),
                  child: Row(
                    children: [
                      Text(
                        "Популярные локации",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(controller.locations.length, (index) {
                    var item = controller.locations[index];
                    return GestureDetector(
                        onTap: () {
                          mapController.move(
                              LatLng(double.parse(item['geo_x']),
                                  double.parse(item['geo_y'])),
                              15);
                        },
                        child: PopularLocations(
                            price: item['price'],
                            userName: item['user_name'].toString(),
                            title: item['title']));
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MarketContent extends StatelessWidget {
  final price;
  final uid;
  final id;
  final userName;
  final userExp;
  final title;

  const MarketContent(
      {super.key,
      required this.id,
      required this.uid,
      required this.price,
      required this.title,
      required this.userName,
      required this.userExp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
            useSafeArea: false,
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: AlertDialog(
                  backgroundColor: const Color(0xff2D2D2D).withOpacity(0),
                  contentPadding: EdgeInsets.zero,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                  content: Container(
                    height: 333,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                upperfirst(title.toString()),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                price.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userName),
                              Text('Стаж: $userExp года')
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text('Записаться'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Container(
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Get.to(OtherProfileView());
                                      },
                                      child: const Center(
                                        child: Text('Профиль'),
                                      )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        width: 135,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.3),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 13,
            ),
            const SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Text(userName),
                  Text('$price/час')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

String upperfirst(String text) {
  if (text.isEmpty) return text;
  return '${text[0].toUpperCase()}${text.substring(1)}';
}
