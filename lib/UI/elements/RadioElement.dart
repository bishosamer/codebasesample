import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RadioElement extends StatelessWidget {
  final String text;
  final Function(int) fun;
  final bool selected;
  final Color activeColor;
  final int value, groupValue;
  const RadioElement(
      {Key key,
      this.text,
      this.fun,
      this.selected,
      this.activeColor,
      this.value,
      this.groupValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Container(
      height: 16,
      width: mobile ? 150 : 200,
      child: Row(
        children: [
          Radio(
              toggleable: false,
              focusColor: Colors.transparent,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              hoverColor: Colors.transparent,
              activeColor: activeColor,
              value: value,
              groupValue: groupValue,
              onChanged: fun),
          Container(
            width: mobile ? 100 : null,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'medium',
                  fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
