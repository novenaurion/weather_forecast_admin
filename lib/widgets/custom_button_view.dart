import 'package:flutter/material.dart';
import 'package:weatherforecast_admin/constant/dimen_constant.dart';

import 'custom_text_view.dart';
class CustomButtonView extends StatelessWidget {
  const CustomButtonView(
      {Key? key,
        required this.width,
        required this.height,
        this.borderRadius,
        required this.text,
        this.fontColor,
        this.fontSize,
        required this.onPressed,
        this.buttonColor, this.borderColor, this.fontWeight})
      : super(key: key);

  final double width;
  final double height;
  final double? borderRadius;
  final String text;
  final Color? fontColor;
  final double? fontSize;
  final Function onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: borderColor??Colors.grey),
          borderRadius: BorderRadius.circular(borderRadius??marginDefault)),
      child: MaterialButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??marginDefault),
        ),
        onPressed: () {
          onPressed();
        },
        child: Center(
          child: CustomTextView(
            text: text,
            fontColor: fontColor,
            fontSize: fontSize??textRegular,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
