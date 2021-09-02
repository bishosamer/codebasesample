import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RoundedButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final bool isEnabled;
  final double height, width;
  const RoundedButton(
      {Key key,
      this.onPressed,
      this.text,
      this.height,
      this.width,
      this.isEnabled})
      : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  Color bCol;

  bool isHovering;
  @override
  void initState() {
    super.initState();
    bCol = Colors.transparent;
    isHovering = false;
  }

  // you have a valid context here

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    Color txtC = isHovering ? Colors.black : Theme.of(context).accentColor;
    return MouseRegion(
      onEnter: (PointerEvent event) {
        setState(() {
          if (widget.isEnabled) isHovering = true;
        });
      },
      onExit: (PointerEvent event) {
        setState(() {
          isHovering = false;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: MaterialButton(
          focusColor: Colors.black,
          hoverColor: widget.isEnabled
              ? Theme.of(context).accentColor
              : Colors.transparent,
          color: widget.isEnabled ? bCol : Colors.transparent,
          height: widget.height,
          minWidth: widget.width,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                  color: widget.isEnabled
                      ? Theme.of(context).accentColor
                      : Colors.white24,
                  width: 2)),
          splashColor: Theme.of(context).accentColor,
          onPressed: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.only(top:3,left:4),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                    fontFamily: 'medium',
                    fontSize: 14,
                    color: widget.isEnabled ? txtC : Colors.white24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
