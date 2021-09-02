import 'package:FloorFour/logic/FormHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomTextFeild extends StatelessWidget {
  @required
  final Color color;
  final Function onChanged;
  final TextEditingController cont;
  final String hintText, label;
  final GlobalKey<FormState> formKey;
  final int maxLines;
  final Map nap;
  final double pads;
  final BorderStyle borderStyle;
  const CustomTextFeild({
    Key key,
    this.hintText,
    this.maxLines,
    this.cont,
    this.label,
    this.formKey,
    this.nap,
    this.borderStyle,
    this.color,
    this.onChanged,
    this.pads,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Container(
      child: TextFormField(
          onChanged: onChanged,
          key: formKey,
          onSaved: (val) {
            nap[label] = val;

            //  FormHandler.addToMap(label, val, nap);
          },
          validator: (value) {
            if (value.isEmpty && (label != 'notes' && label != 'portLink')) {
              return 'This feild is required';
            }
            return null;
          },
          controller: cont,
          maxLines: maxLines,
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 14),
          cursorColor: Theme.of(context).accentColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(pads),
            hintStyle: TextStyle(color: Colors.white24, fontSize: 14),
            focusColor: Theme.of(context).accentColor,
            filled: false,
            fillColor: Theme.of(context).accentColor,
            hintText: hintText,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: borderStyle, width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(3),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: borderStyle,
                  width: 2,
                  color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(25),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(style: borderStyle, width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(25),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  style: borderStyle,
                  width: 2,
                  color: Theme.of(context).accentColor),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.solid, width: 2, color: color),
              borderRadius: BorderRadius.circular(25),
            ),
          )),
    );
  }
}
