import 'package:FloorFour/UI/Screens/ApplyForm.dart';
import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/ProjectForm.dart';
import 'package:FloorFour/UI/elements/ColorChanger.dart';
import 'package:FloorFour/UI/elements/NavBar.dart';
import 'package:FloorFour/UI/elements/TabSelector.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final int index;

  const ContactPage({Key key, this.index}) : super(key: key);
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  TabController cont;

  @override
  void initState() {
    super.initState();
    cont = TabController(length: 2, vsync: this);
    if (widget.index != null)
      cont.index = widget.index;
    else
      cont.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(children: [
              PageView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 800,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70, bottom: 20),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).accentColor,
                                  width: 3,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 460, height: 30,
                            // decoration: BoxDecoration(borderRadius:StadiumBorder(side: BorderSide(color: )) ),
                            child: TabSelector(
                              cont: cont,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: MediaQuery.of(context).size.width,
                        child: TabBarView(controller: cont, children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                    (1 / 12)),
                            child: ProjectForm(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width *
                                    (1 / 12)),
                            child: ApplyForm(),
                          )
                        ]),
                      ),
                    ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ContactFooter(
                        cRoute: '/contact',
                        mobile: false,
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
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ColorChanger(),
              ),
              NavBar(
                backgroundColor: Colors.transparent,
                cRoute: '/contact',
              )
            ])));
  }
}
