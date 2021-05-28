import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/input_widgets/custom_text_form_field.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';
import 'package:flutter_otp/flutter_otp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({this.signUpPassWordController});
  final TextEditingController? signUpPassWordController;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FlutterOtp flutterOtp = FlutterOtp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  mediumVerticalSizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 6,
                            color: primaryColor,
                          ),
                          smallHorizontalSizedBox,
                          Text(
                            signUpString,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: primaryColor)),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                        child: Text(loginString,
                            style: TextStyle(color: primaryColor)),
                      )
                    ],
                  ),
                  mediumVerticalSizedBox,
                  CustomInputLabel(labelString: shopNameString),
                  smallVerticalSizedBox,
                  CustomTextFormField(),
                  mediumVerticalSizedBox,
                  CustomInputLabel(labelString: enterPasswordString),
                  smallVerticalSizedBox,
                  CustomTextFormField(
                    customController: widget.signUpPassWordController,
                  ),
                  mediumVerticalSizedBox,
                  CustomInputLabel(labelString: reenterPasswordString),
                  smallVerticalSizedBox,
                  CustomTextFormField(
                    customController: widget.signUpPassWordController,
                  ),
                  mediumVerticalSizedBox,
                  CustomInputLabel(labelString: enterPhonenumberString),
                  smallVerticalSizedBox,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          customController: widget.signUpPassWordController,
                        ),
                      ),
                      smallHorizontalSizedBox,
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          height: 45,
                          minWidth: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              side: BorderSide(color: primaryColor)),
                          onPressed: () async {
                            flutterOtp.generateOtp();
                            flutterOtp.sendOtp('+254724609783');
                          },
                          child: Text(sendOTP,
                              style: TextStyle(color: primaryColor)),
                        ),
                      )
                    ],
                  ),
                  mediumVerticalSizedBox,
                  CustomInputLabel(labelString: enterVerificationString),
                  smallVerticalSizedBox,
                  CustomTextFormField(
                    customController: widget.signUpPassWordController,
                  ),
                ],
              ),
            ),
            MaterialButton(
              height: number56,
              minWidth: double.infinity,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homePage);
              },
              child: Text(
                completeSignUpString,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
