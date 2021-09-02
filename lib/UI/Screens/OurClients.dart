import 'package:FloorFour/UI/elements/GeneralCarousel.dart';
import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OurClients extends StatefulWidget {
  final bool mobile;

  const OurClients({Key key, this.mobile}) : super(key: key);
  @override
  _OurClientsState createState() => _OurClientsState();
}

class _OurClientsState extends State<OurClients> {
  int eventCount;
  QuerySnapshot snapshot;

  void initState() {
    super.initState();
    Firestore.instance.collection('clients').getDocuments().then((value) {
      setState(() {
        snapshot = value;
        eventCount = snapshot.documents.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mobile ? null : MediaQuery.of(context).size.height - 200,
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top: widget.mobile ? 50 : 90,
                  bottom: widget.mobile
                      ? 35
                      : MediaQuery.of(context).size.height < 700
                          ? 50
                          : 75),
              child: Container(
                width: widget.mobile
                    ? 50
                    : MediaQuery.of(context).size.width * (5 / 24),
                constraints: BoxConstraints(
                  minWidth: widget.mobile
                      ? 150
                      : MediaQuery.of(context).size.height < 700
                          ? 400
                          : 550,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * (1 / 12) - 10),
                  child: Text(
                    'OUR CLIENTS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 0.86,
                      color: Color(0xf2ffffff),
                      fontFamily: 'black',
                      fontSize: widget.mobile
                          ? 24
                          : MediaQuery.of(context).size.height < 700
                              ? 60
                              : 70,
                    ),
                  ),
                ),
              ),
            ),
          ),
          snapshot != null
              ? Container(
                  height: widget.mobile
                      ? null
                      : MediaQuery.of(context).size.height < 700
                          ? 260
                          : 300,
                  child: GeneralCarousel(
                    mobile: widget.mobile,
                    snapshot: snapshot,
                    eventCount: eventCount,
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: RoundedButton(
                width: widget.mobile ? 250 : 210,
                height: 50,
                isEnabled: true,
                text: 'START A PROJECT NOW',
                onPressed: () {
                  Navigator.pushNamed(context, '/contact', arguments: 0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
