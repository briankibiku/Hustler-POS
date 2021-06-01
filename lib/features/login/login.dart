import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';
import 'package:hustlerpos/constants/numbers.dart';
import 'package:hustlerpos/constants/sizing.dart';
import 'package:hustlerpos/constants/strings.dart';
import 'package:hustlerpos/routes.dart';
import 'package:hustlerpos/shared/labels/custom_input_label.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          loginString,
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
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      child: Text(signUpString,
                          style: TextStyle(color: primaryColor)),
                    )
                  ],
                ),
                mediumVerticalSizedBox,
                Text(
                  accountExistsString,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: shopNameString),
                smallVerticalSizedBox,
                Container(
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusColor: primaryColor,
                        fillColor: primaryColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0))),
                  ),
                ),
                mediumVerticalSizedBox,
                CustomInputLabel(labelString: passwordString),
                smallVerticalSizedBox,
                Container(
                  height: 45,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusColor: primaryColor,
                        fillColor: primaryColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0))),
                  ),
                ),
              ],
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
                loginButtonString,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
