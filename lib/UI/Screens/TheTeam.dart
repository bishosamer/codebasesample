import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/elements/TeamElement.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(minWidth: mobile ? 200 : 500),
          width: mobile ? 200 : MediaQuery.of(context).size.width * (9 / 24),
          child: Padding(
            padding:
                EdgeInsets.only(top: 100, bottom: 50, left: mobile ? 20 : 0),
            child: Text(
              'MEET THE FOUNDERS',
              style: TextStyle(
                  height: 0.86,
                  color: Color(0xf2ffffff),
                  fontFamily: 'black',
                  fontSize: mobile
                      ? 24
                      : MediaQuery.of(context).size.height < 700
                          ? 60
                          : 70),
            ),
          ),
        ),
        mobile
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Founder(
                      img: 'assets/images/Milad.png',
                      pos: '''Founder/
CEO/
The Reason This is All Possible''',
                      name: 'MILAD BASIT',
                    ),
                    Founder(
                      img: 'assets/images/Youssef.png',
                      pos: '''Co-Founder/
Marketing Executive/
Spends His Working Hours in the Car''',
                      name: 'YOUSSEF MORGAN',
                    ),
                    Founder(
                      img: 'assets/images/Mirette.png',
                      pos: '''Co-Founder/
Graphic Designer/
Makes Sure Everything Looks Good''',
                      name: 'MIRETTE MOUDY',
                    )
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Founder(
                      img: 'assets/images/Milad.png',
                      pos: '''Founder/
CEO/
The Reason This is All Possible''',
                      name: 'MILAD BASIT',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Founder(
                      img: 'assets/images/Youssef.png',
                      pos: '''Co-Founder/
Marketing Executive/
Spends His Working Hours in the Car''',
                      name: 'YOUSSEF MORGAN',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Founder(
                      img: 'assets/images/Mirette.png',
                      pos: '''Co-Founder/
Graphic Designer/
Makes Sure Everything Looks Good''',
                      name: 'MIRETTE MOUDY',
                    ),
                  )
                ],
              ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: RoundedButton(
              isEnabled: true,
              onPressed: () {
                Navigator.of(context).pushNamed('/contact', arguments: 1);
              },
              height: MediaQuery.of(context).size.height < 700 ? 35 : 50,
              width: 210,
              text: 'JOIN OUR TEAM NOW',
            ),
          ),
        )
      ],
    );
  }
}
