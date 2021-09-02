import 'package:FloorFour/UI/elements/ContactForm.dart';
import 'package:FloorFour/UI/elements/map.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactFooter extends StatefulWidget {
  final String cRoute;
  final bool mobile;
  const ContactFooter({Key key, this.cRoute, this.mobile}) : super(key: key);
  @override
  _ContactFooterState createState() => _ContactFooterState();
}

class _ContactFooterState extends State<ContactFooter> {
  String titleText;
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cRoute == '/contact') {
      titleText = '...OR DROP US A LINE';
    } else
      titleText = "WE'D LOVE TO HEAR FROM YOU";

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints(minHeight: 650),
        height: widget.mobile ? null : MediaQuery.of(context).size.height - 100,
        width: widget.mobile
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * (10 / 12),
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: widget.cRoute == '/contact'
                    ? widget.mobile
                        ? 200
                        : MediaQuery.of(context).size.width * (4 / 12)
                    : widget.mobile
                        ? 220
                        : MediaQuery.of(context).size.width * (4 / 12),
                constraints: BoxConstraints(
                  minWidth: widget.mobile
                      ? 0
                      : MediaQuery.of(context).size.height < 700
                          ? 450
                          : 500,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height < 700 ? 100 : 70,
                    bottom: widget.mobile
                        ? 30
                        : MediaQuery.of(context).size.height < 700
                            ? 30
                            : 70,
                    left: widget.mobile ? 20 : 0,
                    right: widget.mobile ? 20 : 0,
                  ),
                  child: Text(
                    titleText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 0.86,
                      color: Color(0xf2ffffff),
                      fontFamily: 'black',
                      fontSize: widget.mobile
                          ? 24
                          : MediaQuery.of(context).size.height < 700
                              ? 60
                              : 70,
                    ),
                  ),
                ),
              ),
            ),
            widget.mobile
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ContactForm(
                          mobile: widget.mobile,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 3,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  child: GoogleMap()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                '191, District 3/4, Cairo Governorate',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14,
                                    fontFamily: 'bold'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                '+20 120 088 4601',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14,
                                    fontFamily: 'bold'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                'info@floorfour-eg.com',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14,
                                    fontFamily: 'bold'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FlatButton(
                                    minWidth: 5,
                                    child: Icon(FontAwesomeIcons.facebookF,
                                        color: Theme.of(context).accentColor,
                                        size: 18),
                                    onPressed: () {
                                      launchURL(
                                          'https://www.facebook.com/floorfour.eg');
                                    }),
                                FlatButton(
                                  minWidth: 10,
                                  child: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Theme.of(context).accentColor,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    launchURL(
                                        'https://instagram.com/floorfour_eg?igshid=vtpt6tjjgdq4');
                                  },
                                ),
                                FlatButton(
                                  minWidth: 5,
                                  child: Icon(FontAwesomeIcons.linkedinIn,
                                      color: Theme.of(context).accentColor,
                                      size: 18),
                                  onPressed: () {
                                    launchURL(
                                        'https://www.linkedin.com/company/floorfour');
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactForm(
                        mobile: widget.mobile,
                      ),
                      Spacer(),
                      Center(
                        child: Container(
                          width: 3,
                          height: 330,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                                width: MediaQuery.of(context).size.width *
                                    (4 / 12),
                                height: 180,
                                child: GoogleMap()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            child: Text(
                              '191, District 3/4, Cairo Governorate',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 14,
                                  fontFamily: 'bold'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            child: Text(
                              '+20 120 088 4601',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 14,
                                  fontFamily: 'bold'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 15),
                            child: Text(
                              'info@floorfour-eg.com',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 14,
                                  fontFamily: 'bold'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                  minWidth: 10,
                                  child: Icon(FontAwesomeIcons.facebookF,
                                      color: Theme.of(context).accentColor,
                                      size: 18),
                                  onPressed: () {
                                    launchURL(
                                        'https://www.facebook.com/floorfour.eg');
                                  }),
                              FlatButton(
                                minWidth: 10,
                                child: Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Theme.of(context).accentColor,
                                  size: 18,
                                ),
                                onPressed: () {
                                  launchURL(
                                      'https://instagram.com/floorfour_eg?igshid=vtpt6tjjgdq4');
                                },
                              ),
                              FlatButton(
                                minWidth: 5,
                                child: Icon(FontAwesomeIcons.linkedinIn,
                                    color: Theme.of(context).accentColor,
                                    size: 18),
                                onPressed: () {
                                  launchURL(
                                      'https://www.linkedin.com/company/floorfour');
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
