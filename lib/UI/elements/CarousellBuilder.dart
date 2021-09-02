import 'package:FloorFour/UI/elements/Thumbnail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarouselBuilder extends StatelessWidget {
  final bool mobile;
  final int eventCount;
  final QuerySnapshot snapshot;
  final Function(int) onPageChange;

  const CarouselBuilder(
      {Key key, this.eventCount, this.snapshot, this.onPageChange, this.mobile})
      : super(key: key);
  onPageChanged(int index, CarouselPageChangedReason reason) {
    onPageChange(index);
  }

  @override
  Widget build(BuildContext context) {
    Map docD;
    return Container(
      child: snapshot != null
          ? CarouselSlider.builder(
              itemCount: eventCount,
              itemBuilder: (context, index) {
                if (snapshot == null)
                  return Center(child: CircularProgressIndicator());
                //  print('=============================================$document');
                else {
                  docD = snapshot.documents.elementAt(index).data;

                  return new Thumbnail(
                      mobile: mobile, index: index, url: docD['projectLogo']);
                }
              },
              options: CarouselOptions(
                height: !mobile ? 300 : 200,
                aspectRatio: 1,
                viewportFraction: mobile ? 0.6 : 0.25,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: docD == null,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.linear,
                enlargeCenterPage: false,
                onPageChanged: onPageChanged,
                scrollDirection: Axis.horizontal,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
