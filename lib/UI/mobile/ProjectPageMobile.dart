import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/elements/DrawerItems.dart';
import 'package:FloorFour/UI/elements/ProjectContainer.dart';
import 'package:FloorFour/logic/Project.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:flutter/material.dart';

class ProjectPageMobile extends StatefulWidget {
  final int index;

  const ProjectPageMobile({Key key, this.index}) : super(key: key);
  @override
  _ProjectPageMobileState createState() => _ProjectPageMobileState();
}

class _ProjectPageMobileState extends State<ProjectPageMobile> {
  Project project;
  @override
  void initState() {
    super.initState();
    buildScreen();
  }

  void buildScreen() {
    if (widget.index != null)
      TextGetter.getDocFromIndex('projects', widget.index).then((value) {
        setState(() {
          project = new Project(
              name: value['projName'],
              brief: value['brief'],
              client: value['client'],
              process: value['process'],
              imgUrl: value['projectImage'],
              thumbUrl: value['projectLogo'],
              service: value['service'],
              fbLink: value['fbLink'],
              instaLink: value['instaLink'],
              webLink: value['webLink'],
              date: value['date']);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      endDrawer: DrawerItems(
        route: '/projects',
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
      body: SingleChildScrollView(
        child: project != null
            ? Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Text(
                            '0' +
                                (widget.index + 1).toString() +
                                ' ' +
                                project.client,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Color(0xf2ffffff),
                                fontFamily: 'black',
                                fontSize: 24)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        project.imgUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        child: ProjectContainer(
                            index: widget.index, project: project)),
                  ),
                  ContactFooter(
                    mobile: true,
                    cRoute: '/project',
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
