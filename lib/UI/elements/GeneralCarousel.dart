import 'package:FloorFour/UI/elements/Thumbnail.dart';
import 'package:FloorFour/logic/TextGetter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GeneralCarousel extends StatelessWidget {
  final int eventCount;
  final QuerySnapshot snapshot;
  final bool mobile;
  const GeneralCarousel({Key key, this.eventCount, this.snapshot, this.mobile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int itemCount1, itemCount2;
    Map docD;
    if (eventCount != null) if (eventCount % 2 != 0) {
      itemCount1 = (eventCount / 2).ceil();
      itemCount2 = (eventCount / 2).floor();
    } else
      itemCount2 = itemCount1 = (eventCount / 2) as int;

    print('==============================' +
        (itemCount1 + itemCount2).toString());
    return Column(
      children: [
        Container(
          child: snapshot != null
              ? CarouselSlider.builder(
                  itemCount: itemCount1,
                  itemBuilder: (context, index) {
                    if (snapshot == null)
                      return Center(child: CircularProgressIndicator());
                    //  print('=============================================$document');
                    else {
                      docD = snapshot.documents.elementAt(index).data;

                      return new SizedBox(
                          width: 130,
                          height: 130,
                          child:
                              new Thumbnail(mobile: mobile, url: docD['logo']));
                    }
                  },
                  options: CarouselOptions(
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    pauseAutoPlayOnTouch: false,
                    height: 130,
                    aspectRatio: 1,
                    viewportFraction: mobile ? 0.5 : 0.2,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.linear,
                    enlargeCenterPage: false,
                    // onPageChanged: onPageChanged,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        Container(
          child: snapshot != null
              ? CarouselSlider.builder(
                  itemCount: itemCount2,
                  itemBuilder: (context, index) {
                    index += itemCount2;
                    if (snapshot == null)
                      return Center(child: CircularProgressIndicator());
                    //  print('=============================================$document');
                    else {
                      docD = snapshot.documents.elementAt(index).data;

                      return SizedBox(
                          width: 130,
                          height: 130,
                          child:
                              new Thumbnail(mobile: mobile, url: docD['logo']));
                    }
                  },
                  options: CarouselOptions(
                    pauseAutoPlayOnTouch: false,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    height: 130,
                    aspectRatio: 1,
                    viewportFraction: mobile ? 0.5 : 0.2,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.linear,
                    enlargeCenterPage: false,
                    // onPageChanged: onPageChanged,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }
}
