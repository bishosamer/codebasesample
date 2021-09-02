import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TabSelector extends StatelessWidget {
  final TabController cont;
  const TabSelector({
    Key key,
    this.cont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return TabBar(
      labelPadding: EdgeInsets.only(top:5),
        labelColor: Colors.black,
        controller: cont,
        labelStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'medium',
            fontSize: mobile ? 9 : 14),
        unselectedLabelStyle: TextStyle(
            color: Theme.of(context).accentColor,
            fontFamily: 'medium',
            fontSize: mobile ? 9 : 14),
        physics: AlwaysScrollableScrollPhysics(),
        unselectedLabelColor: Theme.of(context).accentColor,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).accentColor),
        tabs: [
          Tab(
            text: "START A PROJECT",
            // child: Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //       width: 600,
            //       child: Center(
            //           child: Text(
            //         "START A PROJECT",
            //         style:
            //             TextStyle(color: Colors.black),
            //       ))),
            // ),
          ),
          Tab(
            text: "JOIN OUR TEAM",
            // child: Align(
            //   alignment: Alignment.center,
            //   child: Container(
            //       width: 600,
            //       child: Center(
            //           child: Text(
            //         "JOIN OUR TEAM",
            //         style:
            //             TextStyle(color: Colors.black),
            //       ))),
            // ),
          ),
        ]);
  }
}
