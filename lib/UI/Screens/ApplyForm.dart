import 'package:FloorFour/UI/elements/UploadButton.dart';
import 'package:FloorFour/logic/BuildEmpType.dart';
import 'package:FloorFour/UI/elements/FormRow.dart';
import 'package:FloorFour/UI/elements/Jobs.dart';
import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/elements/TextFeild.dart';
import 'package:FloorFour/logic/TextUploader.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ApplyForm extends StatefulWidget {
  @override
  _ApplyFormState createState() => _ApplyFormState();
}

class _ApplyFormState extends State<ApplyForm> {
  String cvLink, bText, sText;
  bool isEnabled, isLoading;
  final formKey = GlobalKey<FormState>();
  TextEditingController te1, te2, te3, te4, te5;
  Map<String, String> map = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    te1 = new TextEditingController();
    te2 = new TextEditingController();
    te3 = new TextEditingController();
    te4 = new TextEditingController();
    te5 = new TextEditingController();
    isLoading = false;
    isEnabled = false;
    sText = 'SUBMIT';

    bText = 'BROWSE';
  }

  checkText() {
    print(te1.text);
    if (te1.text.isNotEmpty &&
        te2.text.isNotEmpty &&
        te3.text.isNotEmpty &&
        map['empType'] != null &&
        map['job'] != null &&
        map['cvlink'] != null)
      setState(() {
        isEnabled = true;
      });
    else
      setState(() {
        isEnabled = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool mobile = deviceType == DeviceScreenType.mobile;
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: mobile
                      ? 30
                      : MediaQuery.of(context).size.height < 700
                          ? 30
                          : 40),
              child: Container(
                width: mobile
                    ? 150
                    : MediaQuery.of(context).size.height < 700
                        ? null
                        : MediaQuery.of(context).size.width * (3 / 12),
                constraints: BoxConstraints(
                  minWidth: mobile ? 0 : 420,
                ),
                child: Text(
                  'HOW CAN YOU HELP?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 0.86,
                      color: Color(0xf2ffffff),
                      fontFamily: 'black',
                      fontSize: mobile
                          ? 24
                          : MediaQuery.of(context).size.height < 700
                              ? 60
                              : 70),
                ),
              ),
            ),
            mobile
                ? Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormRow(
                            cont: te1,
                            onChanged: (String s) {
                              checkText();
                            },
                            label: 'name',
                            map: map,
                            hintText: 'John Doe',
                            text: 'Name',
                          ),
                          FormRow(
                            cont: te2,
                            onChanged: (String s) {
                              checkText();
                            },
                            label: 'email',
                            map: map,
                            hintText: 'example@email.com',
                            text: 'Email',
                          ),
                          FormRow(
                            cont: te3,
                            onChanged: (String s) {
                              checkText();
                            },
                            label: 'phone',
                            map: map,
                            hintText: '+0123456789',
                            text: 'Phone',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              'Position',
                              style: TextStyle(
                                  color: Color(0xf2ffffff),
                                  fontFamily: 'medium',
                                  fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: JobBuilder(
                                  fun: () {
                                    checkText();
                                  },
                                  map: map,
                                  type: 'job',
                                  col: 'jobs',
                                )),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Type of Employment',
                                style: TextStyle(
                                    color: Color(0xf2ffffff),
                                    fontFamily: 'medium',
                                    fontSize: 14)),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: JobBuilder(
                                  fun: () {
                                    checkText();
                                  },
                                  map: map,
                                  type: 'empType',
                                  col: 'empTypes',
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextFeild(
                                pads: 20,
                                onChanged: (String s) {
                                  checkText();
                                },
                                cont: te4,
                                label: 'notes',
                                nap: map,
                                borderStyle: BorderStyle.solid,
                                color: Color(0xf2ffffff),
                                maxLines: 6,
                                hintText: 'Additional notes...',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('Upload your CV here:',
                                  style: TextStyle(
                                      color: Color(0xf2ffffff),
                                      fontFamily: 'medium',
                                      fontSize: 14)),
                            ),
                            UploadButton(
                              fun: () {
                                checkText();
                              },
                              map: map,
                              saveto: 'cvlink',
                              uploadFolder: 'CVs',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: CustomTextFeild(
                                  pads: 20,
                                  cont: te5,
                                  nap: map,
                                  label: 'portLink',
                                  maxLines: 1,
                                  borderStyle: BorderStyle.solid,
                                  color: Theme.of(context).accentColor,
                                  hintText:
                                      'Drop a link to your portfolio here (Behance/dropbox/google drive/etc.)',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                :
                //=========================================================================================================
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * (5 / 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormRow(
                              cont: te1,
                              onChanged: (String s) {
                                checkText();
                              },
                              label: 'name',
                              map: map,
                              hintText: 'John Doe',
                              text: 'Name',
                            ),
                            FormRow(
                              cont: te2,
                              onChanged: (String s) {
                                checkText();
                              },
                              label: 'email',
                              map: map,
                              hintText: 'example@email.com',
                              text: 'Email',
                            ),
                            FormRow(
                              cont: te3,
                              onChanged: (String s) {
                                checkText();
                              },
                              label: 'phone',
                              map: map,
                              hintText: '+0123456789',
                              text: 'Phone',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                'Position',
                                style: TextStyle(
                                    color: Color(0xf2ffffff),
                                    fontFamily: 'medium',
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    (5 / 12),
                                child: JobBuilder(
                                  fun: () {
                                    checkText();
                                  },
                                  map: map,
                                  type: 'job',
                                  col: 'jobs',
                                )),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * (5 / 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('  Type of Employment',
                                  style: TextStyle(
                                      color: Color(0xf2ffffff),
                                      fontFamily: 'medium',
                                      fontSize: 14)),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    (5 / 12),
                                child: JobBuilder(
                                  fun: () {
                                    checkText();
                                  },
                                  map: map,
                                  type: 'empType',
                                  col: 'empTypes',
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 100,
                                child: CustomTextFeild(
                                  pads: 20,
                                  onChanged: (String s) {
                                    checkText();
                                  },
                                  cont: te4,
                                  label: 'notes',
                                  nap: map,
                                  borderStyle: BorderStyle.solid,
                                  color: Color(0xf2ffffff),
                                  maxLines: 6,
                                  hintText: 'Additional notes...',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('Upload your CV here:',
                                  style: TextStyle(
                                      color: Color(0xf2ffffff),
                                      fontFamily: 'medium',
                                      fontSize: 14)),
                            ),
                            UploadButton(
                              fun: () {
                                checkText();
                              },
                              map: map,
                              saveto: 'cvlink',
                              uploadFolder: 'CVs',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    (5 / 12),
                                child: CustomTextFeild(
                                  pads: 20,
                                  cont: te5,
                                  nap: map,
                                  label: 'portLink',
                                  maxLines: 1,
                                  borderStyle: BorderStyle.solid,
                                  color: Colors.white,
                                  hintText:
                                      'Drop a link to your portfolio here (Behance/dropbox/google drive/etc.)',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                isEnabled: isEnabled,
                height: 40,
                width: 120,
                text: sText,
                onPressed: () async {
                  print('=============' +
                      formKey.currentState.validate().toString());
                  if (isEnabled && formKey.currentState.validate()) {
                    formKey.currentState.save();

                    await uploadToCol(col: 'jobApplications', data: map);
                    setState(() {
                      sText = 'SUBMITTED';
                    });
                  }
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
