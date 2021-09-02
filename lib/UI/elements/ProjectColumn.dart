import 'package:FloorFour/UI/elements/ProjectColElement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectColumn extends StatelessWidget {
  final bool mobile;
  final int eventCount, selected;
  final QuerySnapshot snapshot;

  const ProjectColumn(
      {Key key, this.eventCount, this.snapshot, this.selected, this.mobile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController cont = new ScrollController();

    Map docD;
    return Container(
        constraints: BoxConstraints(
            maxWidth: mobile ? 100 : 300, maxHeight: mobile ? 100 : 200),
        child: ListView.builder(
          controller: cont,
          shrinkWrap: true,
          itemCount: eventCount,
          itemBuilder: (context, index) {
            if (snapshot != null)
              docD = snapshot.documents.elementAt(index).data;
            else
              return Center(child: CircularProgressIndicator());

            if (docD == null)
              return Center(child: CircularProgressIndicator());
            else {
              cont.animateTo(60 * selected as double,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
              return new ProjectColElement(
                  mobile: mobile,
                  client: docD['client'],
                  service: docD['service'],
                  index: index,
                  active: index == selected);
            }
          },
        ));
  }
}
