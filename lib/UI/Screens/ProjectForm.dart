import 'package:FloorFour/UI/elements/BuildCheckBox.dart';
import 'package:FloorFour/UI/elements/FormRow.dart';
import 'package:FloorFour/UI/elements/Jobs.dart';
import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/elements/TextFeild.dart';
import 'package:FloorFour/UI/elements/UploadButton.dart';
import 'package:FloorFour/logic/TextUploader.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:universal_html/html.dart';

class ProjectForm extends StatefulWidget {
  @override
  _ProjectFormState createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  String bText, sText;
  final formKey = GlobalKey<FormState>();
  TextEditingController te1, te2, te3, te4, te5, te6;
  bool isEnabled = false;
  bool isLoading = false;
  Map<String, String> map = {};
  @override
  void initState() {
    super.initState();
    te1 = TextEditingController();
    te2 = TextEditingController();
    te3 = TextEditingController();
    te4 = TextEditingController();
    te5 = TextEditingController();
    te6 = TextEditingController();
    sText = 'SUBMIT';
    bText = 'BROWSE';
  }

  checkText() {
    print(map['notes']);
    if ((te1.text.isNotEmpty &&
            te2.text.isNotEmpty &&
            te3.text.isNotEmpty &&
            te4.text.isNotEmpty &&
            te5.text.isNotEmpty &&
            (map.containsKey('service1') ||
                map.containsKey('service2') ||
                map.containsKey('service3') ||
                map.containsKey('service4') ||
                map.containsKey('service5') ||
                map.containsKey('service6') ||
                map.containsKey('service7') ||
                map.containsKey('service8') ||
                map.containsKey('service9') ||
                map.containsKey('service10')) &&
            map['timeFrame'] != null) ||
        map['briefLink'] != null)
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisAlignment: mobile?MainAxisAlignment.spaceEvenly:MainAxisAlignment.start,
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
                'HOW CAN WE HELP?',
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
                  // mainAxisAlignment: mobile
                  //     ? MainAxisAlignment.spaceEvenly
                  //     : MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te1,
                            label: 'name',
                            map: map,
                            hintText: 'John Doe',
                            text: 'Name',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te2,
                            map: map,
                            label: 'email',
                            hintText: 'example@email.com',
                            text: 'Email',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te3,
                            label: 'number',
                            map: map,
                            hintText: '+123456789',
                            text: 'Phone',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te4,
                            label: 'companyName',
                            map: map,
                            hintText: 'Company Name',
                            text: 'Company Name',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te5,
                            label: 'country',
                            map: map,
                            hintText: 'Country',
                            text: 'Country',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              'Needed Service(s)',
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: Color(0xf2ffffff)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: CheckBoxBuilder(
                                  map: map,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Time frame',
                        style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: Color(0xf2ffffff)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: JobBuilder(
                            fun: () {
                              checkText();
                            },
                            map: map,
                            type: 'timeFrame',
                            col: 'timeFrame',
                          )),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: CustomTextFeild(
                        pads: 20,
                        onChanged: (String s) {
                          checkText();
                        },
                        cont: te6,
                        label: 'notes',
                        nap: map,
                        borderStyle: BorderStyle.solid,
                        color: Color(0xf2ffffff),
                        maxLines: 6,
                        hintText: 'Additional notes...',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                color: Color(0xf2ffffff),
                                height: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    color: Color(0xf2ffffff),
                                    fontSize: 24,
                                    fontFamily: 'medium'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Color(0xf2ffffff),
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'You can upload your own brief here:',
                        style: TextStyle(
                            fontFamily: 'medium',
                            fontSize: 14,
                            color: Color(0xf2ffffff)),
                      ),
                    ),
                    UploadButton(
                      fun: checkText(),
                      map: map,
                      saveto: 'briefLink',
                      uploadFolder: 'Briefs',
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (5 / 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te1,
                            label: 'name',
                            map: map,
                            hintText: 'John Doe',
                            text: 'Name',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te2,
                            map: map,
                            label: 'email',
                            hintText: 'example@email.com',
                            text: 'Email',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te3,
                            label: 'number',
                            map: map,
                            hintText: '+123456789',
                            text: 'Phone',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te4,
                            label: 'companyName',
                            map: map,
                            hintText: 'Company Name',
                            text: 'Company Name',
                          ),
                          FormRow(
                            onChanged: (String s) {
                              checkText();
                            },
                            cont: te5,
                            label: 'country',
                            map: map,
                            hintText: 'Country',
                            text: 'Country',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              ' Needed Service(s)',
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: Color(0xf2ffffff)),
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height < 700
                                  ? 168
                                  : null,
                              width:
                                  MediaQuery.of(context).size.width * (5 / 12),
                              child: CheckBoxBuilder(
                                map: map,
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
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '  Time frame',
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: Color(0xf2ffffff)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                                width: MediaQuery.of(context).size.width *
                                    (5 / 12),
                                child: JobBuilder(
                                  fun: () {
                                    checkText();
                                  },
                                  map: map,
                                  type: 'timeFrame',
                                  col: 'timeFrame',
                                )),
                          ),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width * (5 / 12),
                            child: CustomTextFeild(
                              pads: 20,
                              onChanged: (String s) {
                                print('-------------------' + s);
                                checkText();
                              },
                              cont: te6,
                              label: 'notes',
                              nap: map,
                              borderStyle: BorderStyle.solid,
                              color: Color(0xf2ffffff),
                              maxLines: 6,
                              hintText: 'Additional notes...',
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * (5 / 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Color(0xf2ffffff),
                                    height: 2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Color(0xf2ffffff),
                                        fontSize: 24,
                                        fontFamily: 'medium'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Color(0xf2ffffff),
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              'You can upload your own brief here:',
                              style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                  color: Color(0xf2ffffff)),
                            ),
                          ),
                          UploadButton(
                            fun: checkText(),
                            map: map,
                            saveto: 'brieflink',
                            uploadFolder: 'Briefs',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: mobile ? 15 : 0),
            child: Align(
              alignment: Alignment.topCenter,
              child: RoundedButton(
                isEnabled: isEnabled,
                height: 40,
                width: 120,
                text: sText,
                onPressed: () async {
                  if (isEnabled) if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    print(map['brieflink']);
                    await uploadToCol(col: 'proposals', data: map);
                    setState(() {
                      sText = 'SUBMITTED';
                    });
                  }
                },
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
