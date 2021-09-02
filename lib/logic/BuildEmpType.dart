import 'package:FloorFour/UI/elements/RadioElement.dart';
import 'package:FloorFour/UI/elements/ServiceItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:FloorFour/logic/TextGetter.dart';

class EmpType extends StatefulWidget {
  @override
  _EmpTypeState createState() => _EmpTypeState();
}

class _EmpTypeState extends State<EmpType> {
  QuerySnapshot snap;
  int selectedVal;
  @override
  void initState() {
    super.initState();
    TextGetter.getDocs('empTypes').then((value) {
      setState(() {
        snap = value;
      });
    });
  }

  List<Widget> buildJobs() {
    List<Widget> jobs = [];

    if (snap != null)
      for (int i = 0; i < snap.documents.length; i++) {
        Widget temp = RadioElement(
          value: i,
          groupValue: selectedVal,
          text: snap.documents.elementAt(i).documentID,
          fun: (currentUser) {
            //print("Current User ${currentUser.firstName}");
            setSelectedUser(currentUser);
          },
          selected: selectedVal == i,
          activeColor: Theme.of(context).accentColor,
        );

        jobs.insert(i, temp);
      }
    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    return snap != null
        ? Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              children: buildJobs(),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  void setSelectedUser(currentUser) {
    setState(() {
      selectedVal = currentUser;
    });
  }
}
