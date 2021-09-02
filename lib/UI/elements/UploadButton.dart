import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase/firebase.dart' as fb;
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart' as Path;

import 'dart:html' as html;

import 'package:responsive_builder/responsive_builder.dart';

class UploadButton extends StatefulWidget {
  final String uploadFolder, saveto;
  final Function fun;
  final Map map;
  const UploadButton(
      {Key key, this.uploadFolder, this.map, this.saveto, this.fun})
      : super(key: key);
  @override
  _UploadButtonState createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  String text, notYet;
  double value = 0;
  bool isUploading, done;
  fb.UploadTask task;
  Color txtC;
  bool isHovering;
  @override
  void initState() {
    super.initState();
    text = '';
    notYet = 'no file selected yet...';
    isHovering = false;
    isUploading = false;
    done = false;
  }

  Future<void> uploadImage(String ref) async {
    isUploading = true;
    html.InputElement upload = html.FileUploadInputElement();
    upload.click();
    upload.onChange.listen((event) {
      final files = upload.files;
      if (files.length == 1) {
        final html.File file = files[0];
        final reader = html.FileReader();
        text = file.name;
        reader.onLoadEnd.listen((e) {
          uploadFile(file, ref).then((value) {
            widget.map[widget.saveto] = value;
            widget.fun();
          });
          print(widget.map);
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }

  Future<String> uploadFile(html.File file, String ref) async {
    try {
      String mimeType = mime(Path.basename(file.name));

      var metadata = fb.UploadMetadata(
        contentType: mimeType,
      );
      fb.StorageReference storageReference =
          fb.storage().ref(ref).child(file.name);
      print(storageReference.fullPath);

      fb.UploadTask task = storageReference.put(file, metadata);
      task.onStateChanged.listen((event) {
        setState(() {
          value = event.bytesTransferred / event.totalBytes;
        });
      });
      Uri imageUri = await task.snapshot.ref.getDownloadURL();

      return imageUri.toString();
    } catch (e) {
      print("File Upload Error $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    txtC = isHovering || value > 0.7
        ? Colors.black
        : Theme.of(context).accentColor;
    return Container(
      width: mobile
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * (5 / 12),
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: value > 0 ? Theme.of(context).accentColor : Colors.white,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Container(
              width: mobile
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * (5 / 12),
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: value > 0
                        ? Theme.of(context).accentColor
                        : Colors.white,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30))),
          isUploading
              ? AnimatedContainer(
                  child: Center(
                      child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'medium',
                        fontSize: 14),
                  )),
                  height: 40,
                  width: mobile
                      ? (MediaQuery.of(context).size.width) * value
                      : (MediaQuery.of(context).size.width * (5 / 12)) * value,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Theme.of(context).accentColor),
                      borderRadius: new BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      )),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      notYet,
                      style: TextStyle(
                          color: Colors.white24,
                          fontFamily: 'medium',
                          fontSize: 14),
                    ),
                  ),
                ),
          Container(
            height: 40,
            child: Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                onEnter: (PointerEvent event) {
                  setState(() {
                    isHovering = true;
                  });
                },
                onExit: (PointerEvent event) {
                  setState(() {
                    isHovering = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.horizontal(
                          right: Radius.circular(20), left: Radius.zero),
                      // border: BorderDirectional(
                      //   start: BorderSide(
                      //       width: 2,
                      //       style: BorderStyle.solid,
                      //       color: Theme.of(context).accentColor),
                      //   end: BorderSide(
                      //       width: 2,
                      //       style: BorderStyle.solid,
                      //       color: Theme.of(context).accentColor),
                      //   top: BorderSide(
                      //       width: 2,
                      //       style: BorderStyle.solid,
                      //       color: Theme.of(context).accentColor),
                      //   bottom: BorderSide(
                      //       width: 2,
                      //       style: BorderStyle.solid,
                      //       color: Theme.of(context).accentColor),
                      // ),
                      border: Border.all(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Theme.of(context).accentColor)),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.horizontal(
                        right: Radius.circular(10), left: Radius.zero),
                    child: MaterialButton(
                      height: 45,
                      elevation: 0,
                      hoverColor: Theme.of(context).accentColor,
                      child: Text(
                        value == 1 ? 'DELETE' : 'BROWSE',
                        style: TextStyle(color: txtC, fontFamily: 'medium'),
                      ),
                      onPressed: () async {
                        await uploadImage(widget.uploadFolder);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
