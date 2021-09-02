import 'package:FloorFour/UI/elements/RadioElement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class JobBuilder extends StatefulWidget {
  final Map map;
  @required
  final Function fun;
  @required
  final String col, type;

  const JobBuilder({Key key, this.col, this.map, this.type, this.fun})
      : super(key: key);
  @override
  _JobBuilderState createState() => _JobBuilderState();
}

class _JobBuilderState extends State<JobBuilder> {
  QuerySnapshot snap;
  int selectedVal;
  @override
  void initState() {
    super.initState();
    TextGetter.getDocs(widget.col).then((value) {
      setState(() {
        snap = value;
      });
    });
  }

  List<Widget> buildJobs(bool mobile) {
    List<Widget> jobs = [];

    if (snap != null)
      for (int i = 0; i < snap.documents.length; i++) {
        Widget temp = Container(
            width: widget.col == 'jobs' && !mobile ? 220 : 160,
            height: widget.col == 'jobs' ? 50 : 22,
            child: FlatButton(
              onPressed: () {
                widget.map[widget.type] =
                    snap.documents.elementAt(i).documentID;
                //print("Current User ${currentUser.firstName}");
                setSelectedUser(i);
              },
              child: RadioElement(
                value: i,
                groupValue: selectedVal,
                text: snap.documents.elementAt(i).documentID,
                fun: (currentUser) {
                  widget.map[widget.type] =
                      snap.documents.elementAt(i).documentID;
                  //print("Current User ${currentUser.firstName}");
                  setSelectedUser(currentUser);
                },
                selected: selectedVal == i,
                activeColor: Theme.of(context).accentColor,
              ),
            ));

        jobs.insert(i, temp);
      }
    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    bool mobile = deviceType == DeviceScreenType.mobile;

    return snap != null
        ? Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: buildJobs(mobile),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  void setSelectedUser(currentUser) {
    setState(() {
      selectedVal = currentUser;
      widget.fun();
    });
  }
}
