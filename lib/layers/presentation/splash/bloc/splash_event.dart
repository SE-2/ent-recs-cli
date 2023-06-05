import 'package:equatable/equatable.dart';


abstract class SplashEvent extends Equatable {}

class SplashCheckLoginStatus extends SplashEvent {
  SplashCheckLoginStatus();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'CheckLoginStatus { }';
}