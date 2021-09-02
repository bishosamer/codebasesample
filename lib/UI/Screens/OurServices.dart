import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/elements/ServicesBuilder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OurServices extends StatefulWidget {
  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Container(
      height: mobile ? null : 800,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: mobile
                  ? 100
                  : MediaQuery.of(context).size.height < 700
                      ? 400
                      : 500,
            ),
            width: mobile ? 150 : MediaQuery.of(context).size.width * (4 / 24),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 100, bottom: 50, left: mobile ? 20 : 0),
              child: Text(
                'OUR SERVICES',
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
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1400),
              width: MediaQuery.of(context).size.width * (10 / 12),
              child: ServiceBuilder(),
            ),
          ),
          Center(
            child: RoundedButton(
              isEnabled: true,
              onPressed: () {
                Navigator.of(context).pushNamed('/contact', arguments: 0);
              },
              height: MediaQuery.of(context).size.height < 700 ? 35 : 50,
              width: mobile ? 300 : 210,
              text: 'START A PROJECT NOW',
            ),
          )
        ],
      ),
    );
  }
}
