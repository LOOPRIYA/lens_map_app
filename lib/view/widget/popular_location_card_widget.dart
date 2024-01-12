import 'package:flutter/material.dart';

class PopularLocations extends StatelessWidget {
  const PopularLocations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  radius: 23,
                ),
                title: Text("Марьяна"),
                subtitle: Text("Красная площадь"),
                trailing: Text("10000р/сессия"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
