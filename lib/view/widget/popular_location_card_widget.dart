import 'package:flutter/material.dart';

class PopularLocations extends StatelessWidget {
  final userName;
  final title;
  final price;
  const PopularLocations({
    required this.price,
    required this.userName,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const CircleAvatar(
                radius: 23,
              ),
              title: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    userName,
                    style: const TextStyle(fontSize: 16),
                  )),
              subtitle: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  )),
              trailing: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "$price/сессия",
                    style: const TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
