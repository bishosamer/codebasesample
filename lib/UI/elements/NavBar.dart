import 'package:flutter/material.dart';
import 'package:flutter_cursor/flutter_cursor.dart';

class NavBar extends StatelessWidget {
  final String cRoute;
  final Color backgroundColor;
  const NavBar({Key key, this.cRoute, this.backgroundColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (MediaQuery.of(context).size.width / 12) - 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () {
                if (cRoute != '/') Navigator.pushNamed(context, '/');
              },
              child: Image.asset('assets/images/logo.png'),
            ),
            Spacer(
              flex: 5,
            ),
            FlatButton(
                onPressed: () {
                  if (cRoute != '/') Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'PORTFOLIO',
                  style: TextStyle(
                    color: cRoute == '/'
                        ? Theme.of(context).accentColor
                        : cRoute == '/about' &&
                                backgroundColor == Colors.transparent
                            ? Colors.black
                            : Color(0xf2ffffff),
                    fontFamily: 'medium',
                    fontSize: 15,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(30),
              child: FlatButton(
                  onPressed: () {
                    if (cRoute != '/about')
                      Navigator.pushNamed(context, '/about');
                  },
                  child: Text(
                    'ABOUT',
                    style: TextStyle(
                      color: cRoute == '/about'
                          ? Theme.of(context).accentColor
                          : cRoute == '/about' &&
                                  backgroundColor == Colors.transparent
                              ? Colors.black
                              : Color(0xf2ffffff),
                      fontFamily: 'medium',
                      fontSize: 15,
                    ),
                  )),
            ),
            FlatButton(
                onPressed: () {
                  print(ModalRoute.of(context).isCurrent);
                  if (cRoute != '/contact')
                    Navigator.pushNamed(context, '/contact', arguments: 0);
                },
                child: Text(
                  'CONTACT',
                  style: TextStyle(
                    color: cRoute == '/contact'
                        ? Theme.of(context).accentColor
                        : cRoute == '/about' &&
                                backgroundColor == Colors.transparent
                            ? Colors.black
                            : Color(0xf2ffffff),
                    fontFamily: 'medium',
                    fontSize: 15,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
