
// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import '../../custom_textfield_widget.dart';

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
                  CustomTextFieldWidget(
                      controller: _descriptionController,
                      text: "Описание",
                      password: false),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 42.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Начало',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Конец',
                              style: GoogleFonts.inter(
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
                  //  controller.createServise(name: _nameController.text, categoryId: controller.categoryId.value, categoryName: controller.category.value, description: _descriptionController.text, price: _priceController.text);
                    Navigator.pop(context);
                  },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text('Создать',
                          style: GoogleFonts.inter(
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
