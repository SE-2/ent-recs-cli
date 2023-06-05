import 'package:supermedia/layers/data/models/media_metadata_model.dart';

class MediaMetadataDetailsModel {
  final MediaMetadataModel model;
  final String decoration;
  final bool isBookMarked;
  final bool isLiked;

  MediaMetadataDetailsModel(
      {required this.model,
      required this.decoration,
      this.isBookMarked = false,
      this.isLiked = false});

  factory MediaMetadataDetailsModel.fromJson(Map<String, dynamic> json) {
    return MediaMetadataDetailsModel(
      model: MediaMetadataModel.fromJson(json['metadata']),
      decoration: json['decoration'],
      isBookMarked: json['bookMarked'] ?? false,
      isLiked: json['liked'] ?? false,
    );
  }
}
