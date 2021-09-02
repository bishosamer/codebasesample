import 'package:FloorFour/UI/elements/BrandColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeChange extends ChangeNotifier {
  Color accentColor = BrandColors.yellow;
  void changeColor(Color color) {
    this.accentColor = color;
    notifyListeners();
  }
}
