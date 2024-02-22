import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lens_map_app/view/auth_login/registration_screen_view.dart';
import 'package:lens_map_app/view/main/start_view_screen.dart';
import 'package:lens_map_app/view/widget/auth_login/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/textfield_widget.dart';
TextEditingController _userLoginController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

Future<int> login() async {
  Dio dio = Dio();
 final response = await dio.post('http://63.251.122.116:2308/login',
  data: {
    'email': _userLoginController.text,
    'password': _passwordController.text,
  });
 print(_userLoginController.text);
 print(_passwordController.text);
 var data = jsonDecode(response.data);
 print(data);
 if(data['success'] == false) {
   return -1;
 }
 else {
   return int.parse(data['uid']);
 }
}

class Authorization extends StatelessWidget {
  const Authorization({super.key});

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
                 int success = await login();
                 print(success);
                 success != -1 ?  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Start())) : null;
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
