import 'package:FloorFour/UI/elements/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:FloorFour/main.dart' as main;
import 'package:provider/provider.dart';

class ColorChangerButton extends StatefulWidget {
  final Color color;

  const ColorChangerButton({Key key, this.color}) : super(key: key);
  @override
  _ColorChangerButtonState createState() => _ColorChangerButtonState();
}

class _ColorChangerButtonState extends State<ColorChangerButton> {
  double size;
  bool filled;
  @override
  void initState() {
    super.initState();
    size = 11;
    filled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: MouseRegion(
        onEnter: (PointerEvent p) {
          setState(() {
            size = 13;
            filled = true;
          });
        },
        onExit: (PointerEvent p) {
          setState(() {
            size = 11;
            filled = false;
          });
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(
        color: widget.color, width: 2, style: BorderStyle.solid),
              borderRadius: new BorderRadius.circular(3),
            ),
            height: size,
            width: size,
            child: MaterialButton(
              minWidth: size,
              height: size,
              shape: RoundedRectangleBorder(),
              elevation: 0,
              color: filled || Theme.of(context).accentColor == widget.color
        ? widget.color
        : Colors.transparent,
              onPressed: () {
                setState(() {
        Provider.of<ThemeChange>(context, listen: false)
            .changeColor(widget.color);
                });
              },
            ),
          ),
      ),
    );
  }
}
