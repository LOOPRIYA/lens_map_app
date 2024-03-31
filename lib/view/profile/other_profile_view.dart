import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/controller/other_profile_conroller.dart';

class OtherProfileView extends GetView<OtherProfileController> {
  const OtherProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtherProfileController());
    final reviews = controller.service.length;
    final experience = controller.userData.value['experience'].toString();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            // controller.userData.value['name'],
            "Профиль",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xffF3F1F1)),
                      height: 100,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16, left: 16),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 32,
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.userData.value['name'], style: const TextStyle(fontSize: 18),),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        const Text("Париж", style: TextStyle(fontSize: 14),),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8),
                                          child: Text(
                                            "Стаж: $experience года",
                                            style:
                                                const TextStyle(color: Colors.grey, fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Text("На карте"),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Услуги", style: TextStyle(fontSize: 24)),
                        Container(
                            width: 80,
                            height: 20,
                            child: const Center(child: Text("Еще", style: TextStyle(color: Colors.grey),)))
                      ],
                    ),
                  ),
                  Wrap(
                      runSpacing: 16,
                      children: List.generate(controller.service.length, (index) {
                        var item = controller.service[index];
                        return const ServiceCard(
                          title: "Фотосессия на фоне Лувра",
                          price: "600",
                        );
                      })),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text(
                          "Примеры работ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ExampleCard(),
                        ExampleCard(),
                        ExampleCard(),
                      ],
                    ),
                  ),
                  SizedBox(height: 32,),
                  Container(
                    color: Color(0xffF3F1F1),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Отзывы",
                                style: TextStyle(fontSize: 24),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                "$reviews",
                                style:
                                    const TextStyle(fontSize: 24, color: Colors.grey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '5.0',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffF3F1F1),
                    height: 300,
                    child: Column(
                      children: List.generate(controller.reviews.length, (index) {
                        var item = controller.reviews[index];
                        return ReviewCard(
                          title: item["title"],
                          rating: item["rating"],
                        );
                      }),
                    ),
                  ),
               ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.redAccent),
                  width: Get.width,
                  height: 50,
                  child: Center(child: Text("Записаться",style: TextStyle(color: Colors.white, fontSize: 20,),)),
                ),
              ),
            ),],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final title;
  final rating;

  const ReviewCard({
    super.key,
    this.title,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    int index = int.tryParse(rating)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white),
        height: 100,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Вера",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                      children: List.generate(
                          index,
                          (index) => const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orangeAccent,
                              )))
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Все очень понравилось, спасибо большое! буду приходить к вам еще!",
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final title;
  final price;

  const ServiceCard({
    super.key,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffF3F1F1)),
        height: 100,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text("$price₽ в час")
                ],
              ),
              const SizedBox(height: 8,),
              const Text(
                  "Вас ждет невероятно прекраснейшая фотосессия на фоне великого музе, Лувра...", style: TextStyle(fontWeight: FontWeight.w300),)
            ],
          ),
        ),
      ),
    );
  }
}

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffF3F1F1)),
          height: 150,
          width: 300,
        ));
  }
}
