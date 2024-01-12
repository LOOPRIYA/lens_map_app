import 'package:flutter/material.dart';

class PhotographerCard extends StatelessWidget {
  const PhotographerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7, left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: 130,
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
                  title: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Анфиса",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Любая локация в Москве",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Стаж: 10 лет",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          "От 1000р / сессия (1 час)",
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  trailing: Text("4.3/5"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}