import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Founder extends StatelessWidget {
  const Founder({Key key, this.img, this.name, this.pos}) : super(key: key);
  final String img, name, pos;
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white70,
            width: mobile
                ? 150
                : MediaQuery.of(context).size.height < 700
                    ? 140
                    : 175,
            height: mobile
                ? 150
                : MediaQuery.of(context).size.height < 700
                    ? 140
                    : 175,
            child: Image.asset(img),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: mobile ? 20 : 25),
          child: Text(
            name,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontFamily: 'medium',
                fontSize: mobile ? 11 : 14),
          ),
        ),
        Container(
          width: 175,
          child: Padding(
            padding:
                EdgeInsets.only(top: mobile ? 10 : 25, bottom: mobile ? 35 : 0),
            child: Text(
              pos,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xf2ffffff),
                  fontFamily: 'medium',
                  fontSize: mobile ? 11 : 14),
            ),
          ),
        )
      ],
    );
  }
}
