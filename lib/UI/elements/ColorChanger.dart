import 'package:FloorFour/UI/elements/BrandColors.dart';
import 'package:FloorFour/UI/elements/ColorChangerButton.dart';
import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
      child: Container(
        width: 30,
        height: 30,
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.vertical,
          children: [
            ColorChangerButton(
              color: BrandColors.yellow,
            ),
            ColorChangerButton(
              color: BrandColors.orange,
            ),
            ColorChangerButton(
              color: BrandColors.pink,
            ),
            ColorChangerButton(
              color: BrandColors.green,
            ),
          ],
        ),
      ),
    );
  }
}
