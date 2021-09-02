import 'package:FloorFour/logic/FormHandler.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomCheckBox extends StatefulWidget {
  final Function fun;
  final int index;
  final Map map;
  final String text;
  const CustomCheckBox({
    Key key,
    this.map,
    this.text,
    this.index,
    this.fun,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool sel = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          sel = !sel;
          if (sel) {
            FormHandler.addToMap(
                'service' + widget.index.toString(), widget.text, widget.map);
          } else
            FormHandler.removeFromMap(
                'service' + widget.index.toString(), widget.map);
        });
      },
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                border: new Border.all(
                    color: Theme.of(context).accentColor,
                    width: 2,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Transform.scale(
                scale: 0.4,
                child: CircularCheckBox(
                  inactiveColor: Colors.transparent,
                  checkColor: Theme.of(context).accentColor,
                  value: sel,
                  activeColor: Theme.of(context).accentColor,
                  onChanged: (bool check) {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 100,
              child: Text(
                widget.text,
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
