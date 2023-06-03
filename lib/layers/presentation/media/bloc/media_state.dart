import 'package:equatable/equatable.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';

abstract class MediaState extends Equatable {
  @override
  List<Object> get props => [];
}

class MediaInitial extends MediaState {}

class MediaLoading extends MediaState {}

class MediaSuccess extends MediaState {
  final MediaMetadataDetail result;

  MediaSuccess({required this.result});

  @override
  List<Object> get props => [result];
}

class MediaFailure extends MediaState {
  final String error;

  MediaFailure({required this.error});

  @override
  List<Object> get props => [error];
}
