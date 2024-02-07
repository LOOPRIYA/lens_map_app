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
                title: FittedBox(alignment: Alignment.centerLeft,fit: BoxFit.scaleDown,child: Text("Марьяна", style: TextStyle(fontSize: 16),)),
                subtitle: FittedBox(alignment: Alignment.centerLeft,fit: BoxFit.scaleDown,child: Text("Красная площадь", style: TextStyle(fontSize: 16),)),
                trailing: FittedBox(fit: BoxFit.scaleDown,child: Text("10000р/сессия", style: TextStyle(fontSize: 16),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
