import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/TheTeam.dart';
import 'package:FloorFour/UI/elements/AboutRow.dart';
import 'package:FloorFour/UI/Screens/OurServices.dart';
import 'package:FloorFour/UI/elements/ColorChanger.dart';
import 'package:FloorFour/UI/elements/NavBar.dart';
import 'package:FloorFour/UI/elements/ToTopButton.dart';
import 'package:flutter/material.dart';
import 'package:FloorFour/UI/elements/Cursor.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Color navCol;
  @override
  void initState() {
    super.initState();
    navCol = Colors.transparent;
  }

  PageController cont = new PageController();
  String aboutText = '''“Where are we meeting today, guys?”
“Why is it even a question anymore? The fourth floor, of course!”

This is in case you were wondering where the name came from:
4 values. 4 pillars of marketing. 4 floors to ascend.

We are a young group of individuals from  different professional backgrounds, each with a passion to be part of something bigger than themselves. So we brought everything we know together, to build on one another and create a single entity which provides a premium service to other businesses. We offer client-tailored, research-based solutions, on both graphic design and marketing fronts, for companies in all business sectors. From ideation to production and execution, we are here to make sure your company gets what it needs to achieve its goal. We believe that we only succeed when the client we serve succeeds first.

MISSION
Provide efficient  high-quality design and marketing solutions which 
propel the entities we serve further into their journey to success.

VALUES
Work hard. Work smart. Work different. Work together.''';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: [
              PageView(
                onPageChanged: (int index) {
                  if (index > 0)
                    setState(() {
                      navCol = Theme.of(context).backgroundColor;
                    });
                  else
                    setState(() {
                      navCol = Colors.transparent;
                    });
                },
                scrollDirection: Axis.vertical,
                controller: cont,
                children: [
                  AboutRow(aboutText: aboutText),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * (1 / 12)),
                    child: Center(child: OurServices()),
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
                          padding: const EdgeInsets.only(bottom: 10, right: 10),
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
              NavBar(
                backgroundColor: navCol,
                cRoute: '/about',
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ColorChanger(),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: ToTopButton(
                    cont: cont,
                  )),
            ],
          )),
    );
  }
}
