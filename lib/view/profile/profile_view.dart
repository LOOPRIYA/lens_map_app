import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: Colors.white
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 32,),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Андрей Ковалёв',
                        style: TextStyle(fontSize: 18),),
                        SizedBox(height: 3,),
                        Text('jekcatpopov@gmail.com',
                        style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Локации работы'),
                        GestureDetector(child: const Text('Добавить'),
                        onTap: () {
                          Get.bottomSheet(
                            Container(

                            )
                          );
                        },),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(10, (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 32,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Красная площадь'),
                                    Text('от 1100р/час'),
                                  ],
                                ),
                              ),
                              Text('Пн-Пт с 11:00 до 23:00'),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
