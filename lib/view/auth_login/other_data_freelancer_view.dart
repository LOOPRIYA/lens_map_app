import 'package:flutter/material.dart';
import 'package:lens_map_app/data/tag_data.dart';
import 'package:lens_map_app/view/auth_login/add_photo_freelancer_view.dart';

import '../widget/auth_login/text_above_textfield_widget.dart';
import '../widget/auth_login/textfield_widget.dart';
FocusNode _focusNode = FocusNode();
TextEditingController profileDescriptionController = TextEditingController();
TextEditingController experienceController = TextEditingController();
class OtherDataFreelancerView extends StatelessWidget {
  const OtherDataFreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Шаг 1 из 2',
          style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0xff1c1d30),
        ),
        backgroundColor: const Color(0xff1c1d30),
        body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextAbove(text: "Ваш опыт работы"),
            LoginTextField(
              controller: experienceController,
              text: "Укажите Ваш опыт",
            ),
            const SizedBox(height: 12,),
            const TextAbove(text: "Описание профиля"),
            const SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                focusNode: _focusNode,
                maxLines: 10,
                minLines: 5,
                maxLength: 1000,
                controller: profileDescriptionController,
                decoration: InputDecoration(

                  hintStyle: const TextStyle(
                    color: Color(
                      0xFFCBCBCB,
                    ),
                  ),
                  hintText: 'Опишите свой профиль',
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),),
            ),
            const SizedBox(height: 30,),
            const TextAbove(text: "Добавьте теги"
            ),
          SizedBox(
            height: 150,
            child: GridView.count(
              primary: false,
              //   padding: const EdgeInsets.all(20),
              crossAxisSpacing: 5,
              mainAxisSpacing: 4,
              crossAxisCount: 2,
              childAspectRatio: (7),
              children: List.generate(tags.length, (index) => TagWidget(
                title: tags[index],
              )),

            ),
          ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPhotoFreelancerView()));
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
      ),),
    );
  }
}

class TagWidget extends StatefulWidget {
  bool tap = false;
  final String title;
  TagWidget({super.key, required this.title});

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        widget.tap = !widget.tap;
        print(widget.tap);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: widget.tap == false ? const Color(0xff8875FF) : Colors.green),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 3),
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
