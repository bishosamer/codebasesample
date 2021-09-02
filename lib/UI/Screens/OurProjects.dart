import 'package:FloorFour/UI/elements/CarousellBuilder.dart';
import 'package:FloorFour/UI/elements/ProjectColumn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OurProjects extends StatefulWidget {
  final bool mobile;

  const OurProjects({Key key, this.mobile}) : super(key: key);
  @override
  _OurProjectsState createState() => _OurProjectsState();
}

class _OurProjectsState extends State<OurProjects> {
  int selected = 0;
  int eventCount;
  QuerySnapshot snapshot;

  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('projects').getDocuments().then((value) {
      setState(() {
        snapshot = value;
        eventCount = snapshot.documents.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height < 700 ? 60 : 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (2 / 24),
                      constraints: BoxConstraints(
                        minWidth: widget.mobile
                            ? MediaQuery.of(context).size.width / 2
                            : 550,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: widget.mobile ? 50 : 0,
                            left: MediaQuery.of(context).size.width * (1 / 12)),
                        child: Text(
                          'OUR PROJECTS',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 0.86,
                              color: Color(0xf2ffffff),
                              fontFamily: 'black',
                              fontSize: widget.mobile
                                  ? 24
                                  : MediaQuery.of(context).size.height < 700
                                      ? 60
                                      : 70),
                        ),
                      ),
                    ),
                    Spacer(),
                    !widget.mobile
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                        (1 / 12) -
                                    10,
                                vertical: 8),
                            child: ProjectColumn(
                              mobile: widget.mobile,
                              selected: selected,
                              snapshot: snapshot,
                              eventCount: eventCount,
                            ),
                          )
                        : Container(child: null)
                  ],
                ),
              ),
            ),
            CarouselBuilder(
              mobile: widget.mobile,
              onPageChange: (int val) {
                setState(() => selected = val);
              },
              snapshot: snapshot,
              eventCount: eventCount,
            ),
          ],
        ),
      ),
    );
  }
}
