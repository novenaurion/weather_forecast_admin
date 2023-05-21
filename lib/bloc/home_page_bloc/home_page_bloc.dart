import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/api_constant.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';
import 'package:http/http.dart' as http;

class HomePageBloc extends Bloc<HomePageEvent, HomepageState> {
  static final HomePageBloc _singleton = HomePageBloc._internal();

  factory HomePageBloc() {
    return _singleton;
  }

  HomePageBloc._internal() : super(const HomePageInitial()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<HomepageState> emit) async {
    emit(SendingState());
    if (event.title!.isEmpty || event.message!.isEmpty) {
      emit(HomePageError("Please enter all field"));
    } else {
      try {
        var url = 'https://fcm.googleapis.com/fcm/send';
        var header = {
          "Content-Type": "application/json",
          "Authorization": "key=$apiKey",
        };
        var request = {
          "notification": {
            "title": event.title,
            "body": event.message,
          },
          "priority": "high",
          "to": "/topics/weather_forecast_noti",
        };

        var response = await http.post(Uri.parse(url),
            headers: header, body: json.encode(request));
        print("state==");
        emit(SuccessState("Successfully Send"));
      } catch (e) {
        emit(HomePageError(e.toString()));
      }
    }
  }
}
