import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast_admin/bloc/home_page_bloc/home_page_event.dart';
import 'package:weatherforecast_admin/widgets/custom_button_view.dart';
import 'package:weatherforecast_admin/widgets/custom_text_field_view.dart';
import 'package:weatherforecast_admin/widgets/show_loading_dialog.dart';

import '../bloc/home_page_bloc/home_page_bloc.dart';
import '../bloc/home_page_bloc/home_page_state.dart';
import '../constant/dimen_constant.dart';
import '../widgets/custom_text_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleEditingController = TextEditingController();
    TextEditingController messageEditingController = TextEditingController();

    final bloc = BlocProvider.of<HomePageBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const CustomTextView(
          text: "Admin Panel",
          fontColor: Colors.white,
          fontSize: textRegular3X,
        ),
      ),
      body: BlocBuilder<HomePageBloc, HomepageState>(
        bloc: bloc,
        builder: (context, state) {
          print("stae=+>$state");
          if (state is SendingState) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => showLoadingDialog(
                      context,
                    ));
          } else if (state is HomePageError) {
            WidgetsBinding.instance.addPostFrameCallback((_) => AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.scale,
                  headerAnimationLoop: false,
                  title: 'Error',
                  desc: state.message,
                  btnOkOnPress: () {},
                  btnOkColor: Colors.red,
                ).show());
          }else if (state is SuccessState) {

            Navigator.of(context).pop();
            WidgetsBinding.instance.addPostFrameCallback((_) => AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.scale,
              headerAnimationLoop: false,
              title: 'Success',
              desc: state.message,
              btnOkOnPress: () {},
              btnOkColor: Colors.green,
            ).show());
          }
          return Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: marginDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextView(
                  text: "Send Notication",
                  fontColor: Colors.white,
                  fontSize: textHeading2X,
                ),
                SizedBox(
                  height: marginLarge,
                ),
                CustomTextFieldView(
                  labelText: "Title",
                  controller: titleEditingController,
                ),
                SizedBox(
                  height: marginLarge,
                ),
                CustomTextFieldView(
                  labelText: "Message",
                  maxLine: 8,
                  controller: messageEditingController,
                ),
                SizedBox(
                  height: marginLarge,
                ),
                CustomButtonView(
                    width: double.infinity,
                    height: marginXXXLarge,
                    text: "Send",
                    fontSize: textRegular2XX,
                    fontColor: Colors.black,
                    buttonColor: Colors.white,
                    onPressed: () {
                      bloc.add(SendMessageEvent(titleEditingController.text,
                          messageEditingController.text));
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
