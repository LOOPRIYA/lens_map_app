
// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import '../../custom_textfield_widget.dart';
import '../main/locations_screen_view.dart';


MapController _mapController = MapController();
TextEditingController _categoryController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

class CreateServicesView extends GetView<UserController> {
  const CreateServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Obx(
          () => Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          title: const Text('Создать услугу'),
          centerTitle: true,
          backgroundColor: const Color(0xffFAFAFA),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFieldWidget(
                      controller: _nameController,
                      text: "Название услуги",
                      password: false),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: FlutterMap(
                       mapController: _mapController,
                        options: MapOptions(
                          onTap: (a, b) {
                            print(a);
                            print(b);
                         controller.changePoint( Marker(point: b, child: const Icon(Icons.not_listed_location_rounded)), b);
                          },
                          initialCenter: const LatLng(55.3, 44.2),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                           MarkerLayer(markers: [controller.marker.value]),
                        ]),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFieldWidget(
                    controller: _priceController,
                    text: "Стоимость",
                    password: false,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DayCard(
                        title: 'Пн',
                        index: 0,
                      ),
                      DayCard(
                        title: 'Вт',
                        index: 1,
                      ),
                      DayCard(
                        title: 'Ср',
                        index: 2,
                      ),
                      DayCard(
                        title: 'Чт',
                        index: 3,
                      ),
                      DayCard(
                        title: 'Пт',
                        index: 4,
                      ),
                      DayCard(
                        title: 'Сб',
                        index: 5,
                      ),
                      DayCard(
                        title: 'Вс',
                        index: 6,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                 Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 42.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Начало',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Конец',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 2 -
                                32,
                            child: ListWheelScrollView(
                                itemExtent: 30,
                                children: List.generate(
                                    controller.hours.length,
                                        (index) => StartTimeCard(title: controller.hours.value[index].title, time: controller.hours.value[index].time,))),
                          ),
                          SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 2 -
                                32,
                            child: ListWheelScrollView(
                                itemExtent: 30,
                                children: List.generate(
                                    controller.hours.length,
                                        (index) => EndTimeCard(title: controller.hours.value[index].title, time: controller.hours.value[index].time,))),
                          ),
                        ],
                      ),
                    ],
                  ),
                     const SizedBox(),
                  const SizedBox(height: 32,),
                  GestureDetector(onTap: (){
                    controller.createService(_priceController.text, _nameController.text, controller.lat.value.latitude, controller.lat.value.longitude);
                    Navigator.pop(context);
                  },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text('Создать',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white,
                          ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DayCard extends GetView<UserController> {
  final String title;
  final index;
  const DayCard({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Obx(
          () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: GestureDetector(
          onTap: () {
            controller.setMn(index);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: controller.days[index] == false ? const Color(0xff333333) : Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StartTimeCard extends GetView<UserController> {
  final title;
  final time;
  const StartTimeCard({super.key,required this.title,required this.time});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Obx(
          ()=> GestureDetector(
        onTap: () {
          controller.setStartTime(time);
        },
        child: Container(
          height: 75,
          width: 100,
          color: controller.startTime.value != time ? Colors.grey.shade300 : Colors.red,
          child: Center(
            child: Text(
                title
            ),
          ),
        ),
      ),
    );
  }
}


class EndTimeCard extends GetView<UserController> {
  final String title;
  final int time;
  const EndTimeCard({super.key,required this.title,required this.time});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Obx(
          ()=> GestureDetector(
        onTap: () {
          controller.endTime(time);
        },
        child: Container(
          height: 75,
          width: 100,
          color: controller.endTime.value != time ? Colors.grey.shade300 : Colors.red,
          child: Center(
            child: Text(
                title
            ),
          ),
        ),
      ),
    );
  }
}
