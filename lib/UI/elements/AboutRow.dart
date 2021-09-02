import 'package:flutter/material.dart';

class AboutRow extends StatelessWidget {
  const AboutRow({
    Key key,
    @required this.aboutText,
  }) : super(key: key);

  final String aboutText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/3emara.jpg',
              ),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * (1 / 12)),
        child: Container(
            width: MediaQuery.of(context).size.width * (5 / 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 100,
                        bottom:
                            MediaQuery.of(context).size.height * (75 / 800)),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 320),
                      width: MediaQuery.of(context).size.width * (3 / 12),
                      child: Text(
                        'OUR STORY',
                        style: TextStyle(
                            height: 0.86,
                            color: Color(0xf2ffffff),
                            fontFamily: 'black',
                            fontSize: MediaQuery.of(context).size.height < 700
                                ? 60
                                : 70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 400),
                        width: (MediaQuery.of(context).size.width / 2) - 150,
                        height: MediaQuery.of(context).size.height / 2,
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Text(
                                aboutText,
                                style: TextStyle(
                                    color: Color(0xf2ffffff),
                                    fontFamily: 'medium',
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
