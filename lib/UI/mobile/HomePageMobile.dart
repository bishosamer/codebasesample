import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/OurClients.dart';
import 'package:FloorFour/UI/Screens/OurProjects.dart';
import 'package:FloorFour/UI/elements/DrawerItems.dart';
import 'package:FloorFour/UI/elements/LandingVideo.dart';
import 'package:flutter/material.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  Color appBarCol, bgCol;

  PageController cont = new PageController();
  ScrollPhysics physics;
  @override
  void initState() {
    physics = AlwaysScrollableScrollPhysics();
    appBarCol = bgCol = Colors.transparent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var landingVideo = LandingVideo(
      mobile: true,
      onEnd: () {
        cont.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear);

        bgCol = Theme.of(context).backgroundColor;
        physics = NeverScrollableScrollPhysics();
        appBarCol = Theme.of(context).backgroundColor;
      },
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: landingVideo,
          ),
          Scaffold(
            drawerScrimColor: Colors.transparent,
            endDrawer: DrawerItems(
              route: '/',
            ),
            appBar: AppBar(
              actions: [
                Builder(
                  builder: (context) => FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
                ),
              ],
              titleSpacing: 25,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: appBarCol,
              title: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 100,
                    height: 15,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            backgroundColor: bgCol,
            body: PageView(
              onPageChanged: (val) {
                setState(() {
                  // physics = NeverScrollableScrollPhysics();
                  // appBarCol = Theme.of(context).backgroundColor;
                  // print(appBarCol);
                  landingVideo.onEnd();
                });
              },
              physics: physics,
              controller: cont,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: OurProjects(
                        mobile: true,
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: OurClients(mobile: true),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor),
                      child: ContactFooter(
                        mobile: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
