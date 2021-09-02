import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/OurServices.dart';
import 'package:FloorFour/UI/Screens/TheTeam.dart';
import 'package:FloorFour/UI/elements/DrawerItems.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatefulWidget {
  @override
  _AboutMobileState createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  Color appBarCol, bgCol;
  @override
  void initState() {
    super.initState();
    appBarCol = bgCol = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    ScrollController cont = new ScrollController();
    String aboutText = '''“Where are we meeting today, guys?”
“Why is it even a question anymore? The fourth floor, of course!”

This is in case you were wondering where the name came from:
4 values. 4 pillars of marketing. 4 floors to ascend.

We are a young group of individuals from  different professional backgrounds, each with a passion to be part of something bigger than themselves. So we brought everything we know together, to build on one another and create a single entity which provides a premium service to other businesses. We offer client-tailored, research-based solutions, on both graphic design and marketing fronts, for companies in all business sectors. From ideation to production and execution, we are here to make sure your company gets what it needs to achieve its goal. We believe that we only succeed when the client we serve succeeds first.

MISSION
Provide efficient  high-quality design and marketing solutions which propel the entities we serve further into their journey to success.

VALUES
Work hard. Work smart. Work different. Work together.''';
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      curve: Curves.linear,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/3emara.jpg',
              ),
              fit: BoxFit.fitHeight)),
      child: Scaffold(
        drawerScrimColor: Colors.transparent,
        endDrawer: DrawerItems(
          route: '/about',
        ),
        backgroundColor: bgCol,
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
          automaticallyImplyLeading: true,
          backgroundColor: appBarCol,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 100,
                height: 15,
                child: Image.asset('assets/images/logo.png')),
          ),
        ),
        body: NotificationListener<ScrollNotification>(
            // ignore: missing_return
            onNotification: (Notification not) {
              if (not is ScrollNotification && not.metrics.pixels > 70)
                setState(() {
                  appBarCol = Theme.of(context).backgroundColor;
                });
              else
                setState(() {
                  appBarCol = Colors.transparent;
                });

              if (not is ScrollNotification && not.metrics.pixels > 300)
                setState(() {
                  bgCol = Theme.of(context).backgroundColor;
                });
              else
                setState(() {
                  bgCol = Colors.transparent;
                });
            },
            child: SingleChildScrollView(
                controller: cont,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        constraints: BoxConstraints(minWidth: 180),
                        width: MediaQuery.of(context).size.width * (3 / 12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'OUR STORY',
                            style: TextStyle(
                                height: 0.86,
                                color: Color(0xf2ffffff),
                                fontFamily: 'black',
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          constraints: BoxConstraints(minHeight: 400),
                          width: MediaQuery.of(context).size.width * (3 / 4),
                          height: 300,
                          color: Colors.black38,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              aboutText,
                              style: TextStyle(
                                  color: Color(0xf2ffffff),
                                  fontFamily: 'medium',
                                  fontSize: 9),
                            ),
                          ),
                        ),
                      ),
                    ),
                    OurServices(),
                    ContactFooter(
                      cRoute: '/about',
                      mobile: true,
                    )
                  ],
                ))),
      ),
    );
  }
}
