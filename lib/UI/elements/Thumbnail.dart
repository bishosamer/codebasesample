import 'package:FloorFour/UI/pages/ProjectScreen.dart';
import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  @required
  final bool mobile;
  final String url;
  final int index;
  final Function fun;
  const Thumbnail({Key key, this.url, this.fun, this.index, this.mobile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        if (index != null) {
          print('==============================' + index.toString());
          Navigator.pushNamed(context, '/projects', arguments: index);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
            height: mobile
                ? null
                : MediaQuery.of(context).size.height < 700
                    ? 250
                    : null,
            child: url != null
                ? Image.network(
                    url,
                    fit: BoxFit.fill,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }
}
