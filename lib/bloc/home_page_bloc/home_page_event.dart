import 'package:equatable/equatable.dart';

class HomePageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SendMessageEvent extends HomePageEvent {
  String? title;
  String? message;

  SendMessageEvent(this.title,this.message);
}
