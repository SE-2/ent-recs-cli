import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class BookmarkListDetailsModel {
  final int id;
  final String title;
  final List<MediaType> types;
  final List<MediaMetadataModel> media;

  BookmarkListDetailsModel({
    required this.id,
    required this.title,
    required this.types,
    required this.media,
  });

  factory BookmarkListDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookmarkListDetailsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => MediaType.values[e as int])
          .toList(),
      media: (json['items'] as List<dynamic>)
          .map((e) => MediaMetadataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'types': types.map((e) => e.index).toList(),
      'media': media.map((e) => e.toJson()).toList(),
    };
  }
}