import 'package:equatable/equatable.dart';


abstract class AbstractProfileEvent extends Equatable {}

class LoadAbstractProfile extends AbstractProfileEvent {

  LoadAbstractProfile();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AbstractProfileItems { }';
}