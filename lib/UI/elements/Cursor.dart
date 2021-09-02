import 'package:FloorFour/UI/elements/BrandColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/html.dart';

class Cursor extends MouseRegion {
  static var clickableArea = document.querySelector("flt-glass-pane");
  static var body = document.getElementById("flutter_container");

  Cursor({@required Widget child, BuildContext context})
      : super(
          child: child,
          onHover: (ev) {
            _mouseOnHover(ev, context);
          },
          onExit: (ev) {
            _mouseOnExit(ev, context);
          },
        );

  static void _mouseOnHover(PointerHoverEvent event, BuildContext context) {
    //

    // body.classes.add('purple');
    // body.classes.add('orange');
    //

    if (Theme.of(context).accentColor == BrandColors.green) {
      body.classes = ['green'];
      clickableArea.classes = ['green'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: green;');
    } else if (Theme.of(context).accentColor == BrandColors.yellow) {
      body.classes = ['yellow'];
      clickableArea.classes = ['yellow'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: yellow;');
    } else if (Theme.of(context).accentColor == BrandColors.pink) {
      body.classes = ['purple'];
      clickableArea.classes = ['purple'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: purple;');
    } else if (Theme.of(context).accentColor == BrandColors.orange) {
      body.classes = ['orange'];
      clickableArea.classes = ['orange'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: orange;');
    }

    // clickableArea.classes.add('purple');
    //clickableArea.classes.add('orange');
    //  clickableArea.text;
    //  if (Theme.of(context).accentColor == BrandColors.green)

    //   clickableArea.style.cursor = 'mouse_hover';
    //print(clickableArea);
  }

  static void _mouseOnExit(PointerExitEvent event, BuildContext context) {
    if (Theme.of(context).accentColor == BrandColors.green) {
      body.classes = ['green'];
      clickableArea.classes = ['green'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: green;');
    } else if (Theme.of(context).accentColor == BrandColors.yellow) {
      body.classes = ['yellow'];
      clickableArea.classes = ['yellow'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: yellow;');
    } else if (Theme.of(context).accentColor == BrandColors.pink) {
      body.classes = ['purple'];
      clickableArea.classes = ['purple'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: purple;');
    } else if (Theme.of(context).accentColor == BrandColors.orange) {
      body.classes = ['orange'];
      clickableArea.classes = ['orange'];
      clickableArea.setAttribute('style',
          'position: absolute; top: 0px; right: 0px; bottom: 0px; left: 0px; cursor: orange;');
    }
  }
}
