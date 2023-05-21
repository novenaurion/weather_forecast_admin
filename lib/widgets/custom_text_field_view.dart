import 'package:flutter/material.dart';
import 'package:weatherforecast_admin/constant/dimen_constant.dart';

class CustomTextFieldView extends StatelessWidget {
  const CustomTextFieldView({
    super.key,
    required this.labelText,
    this.controller,
    this.maxLine,
  });

  final String labelText;
  final controller;
  final maxLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: maxLine ?? 1,
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        keyboardType: TextInputType.phone,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          label: Text(
            labelText,
          ),
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.4),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(marginDefault),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(marginDefault),
          ),
        ),
      ),
    );
  }
}
