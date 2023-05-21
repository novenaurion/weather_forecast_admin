import 'package:flutter/material.dart';
import 'package:weatherforecast_admin/constant/dimen_constant.dart';

import 'custom_text_view.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(marginDefault)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: marginLarge,
                ),
                CircularProgressIndicator(color: Colors.black,),
                SizedBox(
                  width: 20,
                ),
                CustomTextView(text: "Loading...",fontColor: Colors.black,),
              ],
            ),
          ),
        );
      });
}
