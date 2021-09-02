import 'package:flutter/material.dart';

class ProjectColElement extends StatefulWidget {
  final String client, service;
  final int index;
  final bool active, mobile;

  const ProjectColElement(
      {Key key,
      this.client,
      this.service,
      this.index,
      this.active,
      this.mobile})
      : super(key: key);

  @override
  _ProjectColElementState createState() => _ProjectColElementState();
}

class _ProjectColElementState extends State<ProjectColElement> {
  double width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            width: widget.active ? 450 : 25,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
            child: Divider(
              color: widget.active
                  ? Theme.of(context).accentColor
                  : Color(0xf2ffffff),
              thickness: 2,
            ),
          ),
          AnimatedContainer(
            width: widget.active
                ? widget.mobile
                    ? 150
                    : 370
                : 50,
            duration: Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: widget.active
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                !widget.active
                    ? Text(
                        '0' + (widget.index + 1).toString(),
                        style: TextStyle(
                            color: Color(0xf2ffffff),
                            fontFamily: 'medium',
                            fontSize: widget.mobile ? 10 : 14),
                      )
                    : Text(''),
                widget.active
                    ? Text(
                        '0' +
                            (widget.index + 1).toString() +
                            ' ' +
                            widget.client +
                            ' - ' +
                            widget.service,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontFamily: 'medium',
                            fontSize: 14),
                      )
                    : Text('')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
