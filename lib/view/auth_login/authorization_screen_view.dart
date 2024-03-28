import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lens_map_app/controller/auth_controller.dart';
import 'package:lens_map_app/view/auth_login/registration_screen_view.dart';
import 'package:lens_map_app/view/main/start_view_screen.dart';
import 'package:lens_map_app/view/widget/auth_login/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/textfield_widget.dart';
TextEditingController _userLoginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();


class Authorization extends GetView<UserController> {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      body: SafeArea(
        child: ListView(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/lens_map_logo.png")),
            const LoginScreenName(
              text: "Авторизация",
            ),
            const TextAbove(text: "Логин или email"),
            LoginTextField(text: "Введите Логин или email",
            controller: _userLoginController,),
            const TextAbove(text: "Пароль"),
            LoginTextField(text: "Введите пароль",controller: _passwordController,),
            Row(
              children: [
                const TextAbove(text: "Нет аккаунта?"),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          decoration: TextDecoration.underline)),
                  child: const Text(
                    "Зарегестрируйтесь!",
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Registration())),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                 int success = await controller.login(_userLoginController.text, _passwordController.text);
                 success != -1 ?  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Start())) :  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(
                       content: Text('Неверный логин или пароль'),
                     ));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width -32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text( 'Войти',
                    style: TextStyle(
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
