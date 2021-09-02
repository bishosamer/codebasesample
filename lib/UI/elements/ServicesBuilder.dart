import 'package:FloorFour/UI/elements/BrandColors.dart';
import 'package:FloorFour/UI/elements/ServiceItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceBuilder extends StatefulWidget {
  @override
  _ServiceBuilderState createState() => _ServiceBuilderState();
}

class _ServiceBuilderState extends State<ServiceBuilder> {
  String col;
  QuerySnapshot snap;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).accentColor == BrandColors.yellow)
      col = 'yellow';
    else if (Theme.of(context).accentColor == BrandColors.green)
      col = 'green';
    else if (Theme.of(context).accentColor == BrandColors.pink)
      col = 'pink';
    else if (Theme.of(context).accentColor == BrandColors.orange)
      col = 'orange';
    return Center(
      child: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
        ServiceItem(
          url: 'illustration',
          col: col,
          name: 'Illustration',
        ),
        ServiceItem(
          url: 'Packaging',
          col: col,
          name: 'Packaging',
        ),
        ServiceItem(
          url: 'Branding',
          col: col,
          name: 'Branding',
        ),
        ServiceItem(
          url: 'socialmedia',
          col: col,
          name: 'Social Media Essentials',
        ),
        ServiceItem(
          url: 'printproduction',
          col: col,
          name: 'Print Production',
        ),
        ServiceItem(
          url: 'indooroutdoor',
          col: col,
          name: 'Indoor & Outdoor branding',
        ),
        ServiceItem(
          url: 'UxUi',
          col: col,
          name: 'UX / UI Design',
        ),
        ServiceItem(
          url: 'on-ground',
          col: col,
          name: 'On-ground Activations',
        ),
        ServiceItem(
          url: 'giveaways',
          col: col,
          name: 'Giveaways',
        ),
        ServiceItem(
          url: 'editorial',
          col: col,
          name: 'Editorial Design',
        ),
      ]),
    );
  }
}
