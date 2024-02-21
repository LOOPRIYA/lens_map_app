import 'package:flutter/material.dart';
import 'package:lens_map_app/view/main/start_view_screen.dart';

class AddPhotoFreelancerView extends StatefulWidget {
  const AddPhotoFreelancerView({super.key});

  @override
  State<AddPhotoFreelancerView> createState() => _AddPhotoFreelancerViewState();
}

class _AddPhotoFreelancerViewState extends State<AddPhotoFreelancerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаг 2 из 2',
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff1c1d30),
      ),
      backgroundColor: const Color(0xff1c1d30),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 16,),
                SizedBox(height: MediaQuery.of(context).size.height / 9.3,),
                Center(child: CircleAvatar(
                  radius: 53,
                  backgroundColor: Colors.grey.shade300,
                )),
                const SizedBox(height: 20,),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      // final ImagePicker picker = ImagePicker();
                      // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    },
                    child: Container(
                      height: 40,
                      width: 225,
                      decoration: BoxDecoration(
                        color:  Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Загрузить фото',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Center(
                  child: Text('Вы можете добавить фото позже', style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  color: Colors.white
                  ),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 5,),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Start()));
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Продолжить',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
