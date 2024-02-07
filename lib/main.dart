import 'package:flutter/material.dart';
import 'package:lens_map_app/view/auth_login/authorization_screen_view.dart';
import 'package:lens_map_app/view/main/chats_screen_view.dart';
import 'package:lens_map_app/view/main/locations_screen_view.dart';
import 'package:lens_map_app/view/main/photographers_screen.dart';
import 'package:lens_map_app/view/auth_login/registration_screen_view.dart';
import 'package:lens_map_app/view/main/start_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Authorization()
    );
  }
}
