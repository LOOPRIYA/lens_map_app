import 'package:flutter/material.dart';
import 'package:lens_map_app/view/authorization_screen_view.dart';
import 'package:lens_map_app/view/chats_screen_view.dart';
import 'package:lens_map_app/view/locations_screen_view.dart';
import 'package:lens_map_app/view/photographers_screen.dart';
import 'package:lens_map_app/view/registration_screen_view.dart';

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