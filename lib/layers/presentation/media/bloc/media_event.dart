import 'package:equatable/equatable.dart';

abstract class MediaEvent extends Equatable {}

class LoadMedia extends MediaEvent {
  final int id;

  LoadMedia(this.id);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadMedia { }';
}
