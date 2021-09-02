import 'package:FloorFour/UI/Screens/ContactFooter.dart';
import 'package:FloorFour/UI/elements/ColorChanger.dart';
import 'package:FloorFour/UI/elements/NavBar.dart';
import 'package:FloorFour/UI/elements/ProjectContainer.dart';
import 'package:FloorFour/UI/elements/ProjectRow.dart';
import 'package:FloorFour/logic/Project.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectScreen extends StatefulWidget {
  // @required final int index;
  final int index;
  const ProjectScreen({Key key, this.index}) : super(key: key);
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  Project project;
  @override
  void initState() {
    super.initState();
    buildScreen();
  }

  buildScreen() {
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
    print(project.brief.length + project.process.length);
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              children: [
                project != null
                    ? Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width *
                                    (1 / 24)),
                            child: SingleChildScrollView(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (7 / 12),
                                        child: CachedNetworkImage(
                                          imageUrl: project.imgUrl,
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          project != null
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    top: 60,
                                    left: MediaQuery.of(context).size.width *
                                        (1 / 24),
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ProjectContainer(
                                          index: widget.index,
                                          project: project)),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                )
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 700,
                            child: ContactFooter(
                              mobile: false,
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          '©FLOORFOUR 2020',
                          style: TextStyle(
                              color: Color(0xf2ffffff),
                              fontFamily: 'medium',
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.topCenter,
                child: NavBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xf2ffffff),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ColorChanger(),
            ),
          ],
        ),
      ),
    );
  }
}
