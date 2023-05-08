part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupWithGoogleButtonPressed extends SignupEvent {
  const SignupWithGoogleButtonPressed();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SignupWithGoogleButtonPressed';
}
