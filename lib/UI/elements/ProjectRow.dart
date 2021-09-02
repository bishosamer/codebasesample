import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectRow extends StatelessWidget {
  const ProjectRow({
    Key key,
    this.text,
    this.title,
  }) : super(key: key);

  final String text, title;

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: mobile ? 11 : 12,
                fontFamily: 'medium'),
          ),
          Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: mobile
                  ? MediaQuery.of(context).size.width - 125
                  : MediaQuery.of(context).size.width * (4 / 12) - 170,
              child: Text(
                text,
                style: TextStyle(
                    color: Color(0xf2ffffff),
                    fontSize: mobile ? 11 : 12,
                    fontFamily: 'medium'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
