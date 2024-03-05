import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lens_map_app/view/auth_login/authorization_screen_view.dart';
import 'package:lens_map_app/view/widget/auth_login/entrance_button_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/textfield_widget.dart';

import 'other_data_freelancer_view.dart';
void registration() async {
  Dio dio = Dio();
  dio.post('http://63.251.122.116:2308/registration',data: {
    'email': emailController.text,
    'password': passwordController.text,
    'freelancer': freelancer,
    'balance': '0',
    'name': nameController.text,
  });
}
bool freelancer = false;

TextEditingController emailController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      body: SafeArea(
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/lens_map_logo.png")),
            const LoginScreenName(
              text: "Регистрация",
            ),
            const TextAbove(text: "email"),
            LoginTextField(
              text: "Введите email",
              controller: emailController,
            ),
            const TextAbove(text: "Имя"),
            LoginTextField(
              text: "Введите имя",
              controller: nameController,
            ),
            const TextAbove(text: "Пароль"),
            LoginTextField(
              text: "Введите пароль",
              controller: passwordController,
            ),
            const TextAbove(text: "Повторите пароль"),
            LoginTextField(
              text: "Повторите пароль",
              controller: confirmController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    freelancer = false;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width / 2 - 48,
                      decoration: BoxDecoration(
                        color: freelancer == true ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                          child: Text(
                        'Я заказачик',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    freelancer = true;
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width / 2 - 48,
                      decoration: BoxDecoration(
                        color: freelancer == false ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                          child: Text(
                        'Я фотограф',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const TextAbove(text: "Есть аккаунт?"),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          decoration: TextDecoration.underline)),
                  child: const Text(
                    "Войдите !",
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Authorization())),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  freelancer == false ? registration() : Navigator.push(context, MaterialPageRoute(builder: (context) => OtherDataFreelancerView()));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width -32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text(freelancer == false ? 'Зарегистрироваться' : 'Продолжить',
                  style: const TextStyle(
                    fontFamily: 'assets/font/UniNeue-Trial-Bold.ttf',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
