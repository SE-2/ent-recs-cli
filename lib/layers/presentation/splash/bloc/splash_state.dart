import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashSuccess extends SplashState {
  final bool isLoggedIn;

  SplashSuccess({required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}

class SplashFailure extends SplashState {
  final String error;

  SplashFailure({required this.error});

  @override
  List<Object> get props => [error];
}
