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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
