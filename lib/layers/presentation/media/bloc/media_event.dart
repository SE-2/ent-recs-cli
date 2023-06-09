import 'package:equatable/equatable.dart';

abstract class MediaEvent extends Equatable {}

class LoadMedia extends MediaEvent {
  final String id;

  LoadMedia(this.id);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadMedia { }';
}

class LikeButtonPressed extends MediaEvent {
  final String mediaId;

  LikeButtonPressed(this.mediaId);

  @override
  List<Object?> get props => [mediaId];
}