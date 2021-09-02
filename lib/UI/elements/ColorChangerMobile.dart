import 'package:FloorFour/UI/elements/BrandColors.dart';
import 'package:FloorFour/UI/elements/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorChangerMobile extends StatefulWidget {
  @override
  _ColorChangerMobileState createState() => _ColorChangerMobileState();
}

class _ColorChangerMobileState extends State<ColorChangerMobile> {
  int currentCol;
  @override
  void initState() {
    super.initState();
    currentCol = 1;
  }

  Map colors = {
    1: BrandColors.yellow,
    2: BrandColors.green,
    3: BrandColors.orange,
    4: BrandColors.pink
  };
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 30,
      minWidth: 30,
      color: Theme.of(context).accentColor,
      onPressed: () {
        setState(() {
          currentCol++;
          if (currentCol > 4) currentCol = 1;
          Provider.of<ThemeChange>(context, listen: false)
              .changeColor(colors[currentCol]);
        });
      },
    );
  }
}
