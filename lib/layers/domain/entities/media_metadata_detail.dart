import 'package:supermedia/layers/data/models/media_metadata_model_details.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class MediaMetadataDetail {
  final MediaMetadata data;
  final String decoration;
  final bool isBookMarked;
  final bool isLiked;

  MediaMetadataDetail(
      {required this.data,
      required this.decoration,
      this.isBookMarked = false,
      this.isLiked = false});

  factory MediaMetadataDetail.fromModel(MediaMetadataDetailsModel model) {
    return MediaMetadataDetail(
      data: MediaMetadata.fromModel(model.model),
      decoration: model.decoration,
      isBookMarked: model.isBookMarked,
      isLiked: model.isLiked,
    );
  }
}
