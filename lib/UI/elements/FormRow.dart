import 'package:FloorFour/UI/elements/TextFeild.dart';
import 'package:FloorFour/logic/FormHandler.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FormRow extends StatelessWidget {
  final Function onChanged;
  final TextEditingController cont;
  final GlobalKey<FormState> formKey;
  final String text;
  final String hintText;
  final Map map;
  final String label;
  const FormRow({
    Key key,
    this.text,
    this.formKey,
    this.hintText,
    this.label,
    this.map,
    this.cont,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Container(
      height: 25,
      width: mobile
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * (4 / 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // mobile ? MainAxisAlignment.start :
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'medium', fontSize: 14, color: Color(0xf2ffffff)),
          ),
          Spacer(flex: 1),
          Container(
            width: mobile ? MediaQuery.of(context).size.width / 2 : 250,
            child: CustomTextFeild(
              pads: 1,
              onChanged: onChanged,
              cont: cont,
              nap: map,
              label: label,
              color: Colors.transparent,
              borderStyle: BorderStyle.none,
              hintText: hintText,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
