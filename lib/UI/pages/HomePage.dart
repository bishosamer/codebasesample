import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/OurClients.dart';
import 'package:FloorFour/UI/elements/ColorChanger.dart';
import 'package:FloorFour/UI/elements/Cursor.dart';
import 'package:FloorFour/UI/elements/LandingVideo.dart';
import 'package:FloorFour/UI/elements/NavBar.dart';
import 'package:FloorFour/UI/Screens/OurProjects.dart';
import 'package:FloorFour/UI/elements/ToTopButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollPhysics pagePhysics = AlwaysScrollableScrollPhysics();
  bool hasEnded = true;
  PageController cont = PageController(
        initialPage: 0,
      ),
      bigCont = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  pagePhysics = NeverScrollableScrollPhysics();
                });
              },
              physics: pagePhysics,
              controller: bigCont,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: LandingVideo(
                    onEnd: () {
                      bigCont.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);

                      pagePhysics = NeverScrollableScrollPhysics();
                    },
                    mobile: false,
                  ),
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: cont,
                      dragStartBehavior: DragStartBehavior.start,
                      physics: AlwaysScrollableScrollPhysics(),
                      pageSnapping: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        OurProjects(
                          mobile: false,
                        ),
                        OurClients(
                          mobile: false,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ContactFooter(
                              mobile: false,
                              cRoute: '/about',
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Text(
                                  '©FLOORFOUR 2020',
                                  style: TextStyle(
                                      color: Color(0xf2ffffff),
                                      fontFamily: 'medium',
                                      fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ColorChanger(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ToTopButton(
                pCont: cont,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: NavBar(
                    backgroundColor: Colors.transparent,
                    cRoute: '/',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
