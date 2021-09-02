import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceItem extends StatefulWidget {
  final String name, url, col;

  const ServiceItem({Key key, this.name, this.url, this.col}) : super(key: key);
  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return widget.url != null
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * (0.5 / 12)),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 30),
              curve: Curves.linear,
              width: 90,
              height: MediaQuery.of(context).size.height < 700 ? 150 : 180,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'images/' + widget.url + '/' + widget.col + '.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xf2ffffff),
                            fontFamily: 'medium',
                            fontSize: mobile ? 11 : 14),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
