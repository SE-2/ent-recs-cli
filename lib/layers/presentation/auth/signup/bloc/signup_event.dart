part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  const SignupButtonPressed();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignupButtonPressed';
}
