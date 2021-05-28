import 'package:flutter/material.dart';
import 'package:hustlerpos/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({this.customController, this.isObscure});
  final TextEditingController? customController;
  final bool? isObscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextFormField(
        controller: customController,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: primaryColor,
          fillColor: fadedPrimaryColor,
          filled: true,
        ),
      ),
    );
  }
}
