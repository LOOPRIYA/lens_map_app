import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import 'package:lens_map_app/view/profile/create_service_view.dart';

TextEditingController placeController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController timeController = TextEditingController();

class ProfileView extends GetView<UserController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    controller.getMyLocations();
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
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(radius: 32,),
                    const SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.userModel.value.name,
                        style: const TextStyle(fontSize: 18),),
                        const SizedBox(height: 3,),
                        Text(controller.userModel.value.email,
                        style: const TextStyle(color: Colors.grey),),
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

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateServicesView()));
                        },),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(controller.myLocations.length, (index) {
                        var item = controller.myLocations[index];
                        return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 32,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item['title']),
                                    Text(item['price']),
                                  ],
                                ),
                                const Text('Пн-Пт с 11:00 до 23:00'),
                              ],
                            ),
                          ),
                        ),
                      );}),
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
