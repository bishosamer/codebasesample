import 'package:flutter/material.dart';

class ToTopButton extends StatefulWidget {
  final ScrollController cont;
  final PageController pCont;

  const ToTopButton({Key key, this.cont, this.pCont}) : super(key: key);
  @override
  _ToTopButtonState createState() => _ToTopButtonState();
}

class _ToTopButtonState extends State<ToTopButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
      child: FlatButton(
          onPressed: () {
            if (widget.cont != null)
              widget.cont.animateTo(0,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            else if (widget.pCont != null)
              widget.pCont.animateToPage(0,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
          },
          child: Image.asset(
            'assets/images/totop.png',
            color: Theme.of(context).accentColor,
          )),
    );
  }
}
