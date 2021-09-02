import 'package:FloorFour/UI/Screens/ApplyForm.dart';
import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/Screens/ProjectForm.dart';
import 'package:FloorFour/UI/elements/DrawerItems.dart';
import 'package:FloorFour/UI/elements/TabSelector.dart';
import 'package:flutter/material.dart';

class ContactPageMobile extends StatefulWidget {
  final int index;

  const ContactPageMobile({Key key, this.index}) : super(key: key);
  @override
  _ContactPageMobileState createState() => _ContactPageMobileState();
}

class _ContactPageMobileState extends State<ContactPageMobile>
    with TickerProviderStateMixin {
  TabController cont;
  int index;
  @override
  void initState() {
    super.initState();
    cont = TabController(length: 2, vsync: this);
    cont.index = widget.index;
    index = widget.index;
    cont.addListener(() {
      setState(() {
        index = cont.index;
        print('========dvsdfvdsf=v=========$index');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      endDrawer: DrawerItems(
        route: '/contact',
      ),
      backgroundColor: Theme.of(context).backgroundColor,
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
        backgroundColor: Theme.of(context).backgroundColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              width: 100,
              height: 15,
              child: Image.asset('assets/images/logo.png')),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).accentColor,
                          width: 3,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 280, height: 30,
                    // decoration: BoxDecoration(borderRadius:StadiumBorder(side: BorderSide(color: )) ),
                    child: TabSelector(
                      cont: cont,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 350),
                height: index == 0 ? 1030 : 935,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: cont,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(child: ProjectForm()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ApplyForm(),
                      )
                    ]),
              ),
              ContactFooter(
                mobile: true,
                cRoute: '/contact',
              )
            ],
          ),
        ),
      ),
    );
  }
}
