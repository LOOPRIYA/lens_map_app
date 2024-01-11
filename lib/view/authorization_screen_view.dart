import 'package:flutter/material.dart';
import 'package:lens_map_app/view/registration_screen_view.dart';
import 'package:lens_map_app/view/widget/entrance_button_widget.dart';
import 'package:lens_map_app/view/widget/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/textfield_widget.dart';

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1d30),
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/lens_map_logo.png")),
            const LoginScreenName(
              text: "Авторизация",
            ),
            TextAbove(text: "Логин или email"),
            LoginTextField(),
            TextAbove(text: "Пароль"),
            LoginTextField(),
            Row(
              children: [
                TextAbove(text: "Нет аккаунта?"),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          decoration: TextDecoration.underline)),
                  child: const Text(
                    "Зарегестрируйтесь !",
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Registration())),
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

