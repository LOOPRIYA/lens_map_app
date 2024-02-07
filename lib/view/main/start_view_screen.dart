import 'package:flutter/material.dart';
import 'package:lens_map_app/view/main/chats_screen_view.dart';
import 'package:lens_map_app/view/main/locations_screen_view.dart';
import 'package:lens_map_app/view/main/photographers_screen.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.map),
                icon: Icon(Icons.map_outlined),
                label: 'Локации',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.people),
                icon: Icon(Icons.people_outlined),
                label: 'Фотографы',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.chat),
                icon: Icon(Icons.chat_outlined),
                label: 'Чат',
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[Locations(), Photographers(), Chats()][currentPageIndex],
      extendBody: true,
    );
  }
}
