import 'package:flutter/material.dart';
import 'package:truck_load_demo/Models/modelData/SizeConfig.dart';

class CategoriesRow extends StatelessWidget {
  final String text;
  final Color color;
  CategoriesRow({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 2.43 * SizeConfig.widthMultiplier,
            height: 1.02 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
            ),
          ),
          SizedBox(width: 1.21 * SizeConfig.widthMultiplier),
          Text(
            text,
            style: TextStyle(fontSize: 2.04 * SizeConfig.textMultiplier),
          )
        ],
      ),
    );
  }
}
