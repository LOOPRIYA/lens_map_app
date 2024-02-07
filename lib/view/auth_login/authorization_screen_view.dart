import 'package:flutter/material.dart';
import 'package:lens_map_app/view/auth_login/registration_screen_view.dart';
import 'package:lens_map_app/view/widget/auth_login/entrance_button_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/login_screen_name_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/text_above_textfield_widget.dart';
import 'package:lens_map_app/view/widget/auth_login/textfield_widget.dart';

String _login = "";

class Authorization extends StatefulWidget {
  const Authorization({super.key});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final userLoginController = TextEditingController();

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
            TextAbove(text: "Логин или email"),
            LoginTextField(text: "Введите Логин или email",),
            TextAbove(text: "Пароль"),
            LoginTextField(text: "Введите пароль"),
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration())),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: EntranceButton(),
            )
          ],
        ),
      ),
    );
  }
}
