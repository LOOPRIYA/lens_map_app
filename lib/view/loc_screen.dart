import 'package:flutter/material.dart';
import 'package:lens_map_app/view/widget/popular_location_card_widget.dart';

class Loc extends StatelessWidget {
  const Loc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 24),
          child: Container(
            height: 368,
            color: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "Популярные локации",
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w400),
          ),
        ),
        PopularLocations(),
        PopularLocations(),
        PopularLocations(),
        PopularLocations(),
        PopularLocations(),
        PopularLocations()
      ],
    );
  }
}