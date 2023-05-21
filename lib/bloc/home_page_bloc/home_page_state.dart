import 'package:equatable/equatable.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomePageInitial extends HomepageState {
  const HomePageInitial();

  @override
  List<Object> get props => [];
}

class SendingState extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomePageError extends HomepageState {
  final String message;
  const HomePageError(this.message);

  @override
  List<Object> get props => [message];
}

class SuccessState extends HomepageState {
  final String message;
  const SuccessState(this.message);

  @override
  List<Object> get props => [message];
}
