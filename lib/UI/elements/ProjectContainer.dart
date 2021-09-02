import 'package:FloorFour/UI/elements/ProjectRow.dart';
import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/pages/ProjectScreen.dart';
import 'package:FloorFour/logic/Project.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContainer extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const ProjectContainer({
    Key key,
    @required this.index,
    @required this.project,
  }) : super(key: key);

  final int index;
  final Project project;

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        height: mobile ? null : MediaQuery.of(context).size.height,
        constraints: BoxConstraints(minWidth: 400),
        width: mobile
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * (3 / 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            mobile
                ? Container(
                    child: null,
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                        '0' + (index + 1).toString() + ' ' + project.client,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color(0xf2ffffff),
                            fontFamily: 'black',
                            fontSize: 70)),
                  ),
            ProjectRow(title: 'CLIENT:', text: project.client),
            ProjectRow(title: 'BRIEF:', text: project.brief),
            ProjectRow(title: 'PROCESS:', text: project.process),
            ProjectRow(title: 'SERVICE:', text: project.service),
            ProjectRow(title: 'DATE:', text: project.date),
            project.fbLink != null ||
                    project.instaLink != null ||
                    project.webLink != null
                ? Row(
                    children: [
                      Text(
                        'LINKS: ',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: mobile ? 11 : 12,
                            fontFamily: 'medium'),
                      ),
                      project.fbLink != null
                          ? FlatButton(
                              onPressed: () {
                                launch(project.fbLink);
                              },
                              child: Icon(
                                FontAwesomeIcons.facebookF,
                                color: Theme.of(context).accentColor,
                                size: 18,
                              ))
                          : Container(
                              child: null,
                            ),
                      project.instaLink != null
                          ? FlatButton(
                              onPressed: () {
                                launch(project.instaLink);
                              },
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                color: Theme.of(context).accentColor,
                                size: 18,
                              ))
                          : Container(
                              child: null,
                            ),
                      project.webLink != null
                          ? FlatButton(
                              onPressed: () {
                                launch(project.webLink);
                              },
                              child: Icon(
                                FontAwesomeIcons.globe,
                                color: Theme.of(context).accentColor,
                                size: 18,
                              ))
                          : Container(
                              child: null,
                            ),
                    ],
                  )
                : Container(
                    child: null,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 300,
                child: FlatButton(
                    onPressed: () {
                      TextGetter.getDoc('portfolio', 'portfolio').then((value) {
                        _launchURL(value['portfolioLink']);
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              'assets/images/dwButton.png',
                              color: Theme.of(context).accentColor,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Download full portfolio",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: mobile ? 11 : 14,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
              alignment: mobile ? Alignment.center : Alignment.centerLeft,
              child: RoundedButton(
                width: mobile ? 250 : 210,
                height: 50,
                isEnabled: true,
                text: 'START A PROJECT NOW',
                onPressed: () {
                  Navigator.pushNamed(context, '/contact', arguments: 0);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
