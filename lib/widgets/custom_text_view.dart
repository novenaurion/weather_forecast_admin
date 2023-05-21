import 'package:flutter/material.dart';
class CustomTextView extends StatelessWidget {
  const CustomTextView({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor = Colors.white,
    this.maxLine,
    this.isUnderLine = false,
    this.textAlign,
    this.lineHeight,
    this.textOverflow,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final Color? fontColor;
  final int? maxLine;
  final bool? isUnderLine;
  final TextAlign? textAlign;
  final double? lineHeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
        overflow: textOverflow,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
        color: fontColor ?? Colors.white,
        height: lineHeight,
        fontFamily: "poppin",
        decoration: isUnderLine == true
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  }
}
