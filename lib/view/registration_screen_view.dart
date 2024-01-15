import 'package:flutter/material.dart';
import 'package:lens_map_app/view/authorization_screen_view.dart';
import 'package:lens_map_app/view/widget/choice_button_registration_widget.dart';
import 'package:lens_map_app/view/widget/entrance_button_widget.dart';
import 'package:lens_map_app/view/widget/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/textfield_widget.dart';

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
            TextAbove(text: "Логин или email"),
            LoginTextField(text: "Введите логин или email",),
            TextAbove(text: "Имя"),
            LoginTextField(text: "Введите имя",),
            TextAbove(text: "Пароль"),
            LoginTextField(text: "Введите пароль",),
            TextAbove(text: "Повторите пароль"),
            LoginTextField(text: "Повторите пароль",),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                choice_button(text: "я фотограф"),
                choice_button(text: "Я заказчик",),
              ],
            ),
            Row(
              children: [
                TextAbove(text: "Есть аккаунт?"),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          decoration: TextDecoration.underline)),
                  child: const Text(
                    "Войдите !",
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authorization())),
                )
              ],
            ),
            Expanded(child: Container()),
            EntranceButton()
          ],
        ),
      ),
    );
  }
}



