import 'package:FloorFour/UI/elements/RoundedButton.dart';
import 'package:FloorFour/UI/elements/TextFeild.dart';
import 'package:FloorFour/logic/TextUploader.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final bool mobile;

  const ContactForm({Key key, this.mobile}) : super(key: key);
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  Map<String, String> map = {
    'firstname': null,
    'lastname': null,
    'email': null,
    'message': null,
  };
  TextEditingController te1, te2, te3, te4;
  bool isEnabled;
  String butText;
  final formKey = GlobalKey<FormState>();
  submit() async {
    formKey.currentState.save();
    print(map);
    if (formKey.currentState.validate())
      uploadText(col: 'inquiries', doc: map['email'], data: map);
  }

  @override
  void initState() {
    super.initState();
    butText = 'SUBMIT';
    isEnabled = false;
    te1 = new TextEditingController();
    te2 = new TextEditingController();
    te3 = new TextEditingController();
    te4 = new TextEditingController();
  }

  checkText() {
    print(te1.text);
    if (te1.text.isNotEmpty &&
        te2.text.isNotEmpty &&
        te3.text.isNotEmpty &&
        te4.text.isNotEmpty)
      setState(() {
        isEnabled = true;
      });
  }

  onPressed() async {
    if (isEnabled) {
      await submit();
      setState(() {
        if (formKey.currentState.validate()) butText = 'SUBMITTED';
      });
    } else
      null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.mobile
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * (5 / 12),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              widget.mobile
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomTextFeild(
                              pads: 20,
                              onChanged: (String text) {
                                checkText();
                                setState(() {});
                              },
                              cont: te1,
                              color: te1.text.isNotEmpty
                                  ? Theme.of(context).accentColor
                                  : Colors.white,
                              borderStyle: BorderStyle.solid,
                              label: 'firstname',
                              nap: map,
                              maxLines: 1,
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomTextFeild(
                              pads: 20,
                              cont: te2,
                              onChanged: (String text) {
                                checkText();
                                setState(() {});
                              },
                              color: te2.text.isNotEmpty
                                  ? Theme.of(context).accentColor
                                  : Colors.white,
                              borderStyle: BorderStyle.solid,
                              label: 'lastname',
                              nap: map,
                              maxLines: 1,
                              hintText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    )

                  //==================================================

                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: ((MediaQuery.of(context).size.width *
                                        (5 / 12)) /
                                    2) -
                                16,
                            child: CustomTextFeild(
                              pads: 20,
                              onChanged: (String text) {
                                checkText();
                                setState(() {});
                              },
                              cont: te1,
                              color: te1.text.isNotEmpty
                                  ? Theme.of(context).accentColor
                                  : Colors.white,
                              borderStyle: BorderStyle.solid,
                              label: 'firstname',
                              nap: map,
                              maxLines: 1,
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: ((MediaQuery.of(context).size.width *
                                        (5 / 12)) /
                                    2) -
                                16,
                            child: CustomTextFeild(
                              pads: 20,
                              cont: te2,
                              onChanged: (String text) {
                                checkText();
                                setState(() {});
                              },
                              color: te2.text.isNotEmpty
                                  ? Theme.of(context).accentColor
                                  : Colors.white,
                              borderStyle: BorderStyle.solid,
                              label: 'lastname',
                              nap: map,
                              maxLines: 1,
                              hintText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widget.mobile
                      ? MediaQuery.of(context).size.width
                      : (MediaQuery.of(context).size.width * (5 / 12)),
                  child: CustomTextFeild(
                    cont: te3,
                    pads: 20,
                    onChanged: (String text) {
                      checkText();
                      setState(() {});
                    },
                    color: te3.text.isNotEmpty
                        ? Theme.of(context).accentColor
                        : Colors.white,
                    borderStyle: BorderStyle.solid,
                    label: 'email',
                    nap: map,
                    maxLines: 1,
                    hintText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widget.mobile
                      ? MediaQuery.of(context).size.width
                      : (MediaQuery.of(context).size.width * (5 / 12)),
                  child: CustomTextFeild(
                    pads: 20,
                    cont: te4,
                    onChanged: (String text) {
                      checkText();
                      setState(() {});
                    },
                    color: te4.text.isNotEmpty
                        ? Theme.of(context).accentColor
                        : Colors.white,
                    borderStyle: BorderStyle.solid,
                    label: 'message',
                    nap: map,
                    maxLines: 4,
                    hintText: 'Type your message here...',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedButton(
                    isEnabled: isEnabled,
                    width: 120,
                    height: 40,
                    onPressed: isEnabled ? onPressed : null,
                    text: butText,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
