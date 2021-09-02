import 'dart:ui';

import 'package:FloorFour/UI/elements/ColorChanger.dart';
import 'package:FloorFour/UI/elements/ColorChangerMobile.dart';
import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  final String route;
  const DrawerItems({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors
            .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 2) + 30,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          elevation: 0,
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        color: route == '/'
                            ? Theme.of(context).accentColor
                            : Colors.white,
                        height: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        width: 75,
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (route != '/') Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'PORTFOLIO',
                            style: TextStyle(
                                color: route == '/'
                                    ? Theme.of(context).accentColor
                                    : Colors.white,
                                fontFamily: 'medium',
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        color: route == '/about'
                            ? Theme.of(context).accentColor
                            : Colors.white,
                        height: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        width: 50,
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (route != '/about')
                              Navigator.pushNamed(context, '/about');
                          },
                          child: Text(
                            'ABOUT',
                            style: TextStyle(
                                color: route == '/about'
                                    ? Theme.of(context).accentColor
                                    : Colors.white,
                                fontFamily: 'medium',
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        
                        color: route == '/contact'
                            ? Theme.of(context).accentColor
                            : Colors.white,
                        height: 3,
                      ),
                    ),
                    Container(
                      width: 63,
                      child: FlatButton(
                        
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (route != '/contact')
                          Navigator.pushNamed(context, '/contact',
                              arguments: 0);
                      },
                      child: Text(
                        'CONTACT',
                        style: TextStyle(
                            color: route == '/contact'
                                ? Theme.of(context).accentColor
                                : Colors.white,
                            fontFamily: 'medium',
                            fontSize: 12),
                      ),
                        ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        color: Theme.of(context).accentColor,
                        height: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            child: Text(
                              'CHANGE THEME COLOR',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontFamily: 'medium',
                                  fontSize: 12),
                            ),
                          ),
                          ColorChangerMobile(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
