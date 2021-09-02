import 'package:FloorFour/UI/elements/CustomCheckBox.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:universal_html/html.dart';

class CheckBoxBuilder extends StatefulWidget {
  final Map map;

  const CheckBoxBuilder({Key key, this.map}) : super(key: key);
  @override
  _CheckBoxBuilderState createState() => _CheckBoxBuilderState();
}

class _CheckBoxBuilderState extends State<CheckBoxBuilder> {
  Map<int, DocumentSnapshot> services;

  _CheckBoxBuilderState();
  @override
  void initState() {
    super.initState();
    TextGetter.getDocs('services').then((value) {
      setState(() {
        services = value.documents.asMap();
      });
    });
  }

  List<Widget> buildBoxes() {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    List<Widget> boxes = [];
    if (services != null) {
      setState(() {
        services.forEach((key, value) {
          boxes.add(Container(
            height: null,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomCheckBox(
                index: key,
                map: widget.map,
                text: value.documentID,
              ),
            ),
          ));
        });
      });
    }
    return boxes;
  }

  @override
  Widget build(BuildContext context) {
    return services != null
        ? Wrap(
            direction: Axis.horizontal,
            children: buildBoxes(),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
