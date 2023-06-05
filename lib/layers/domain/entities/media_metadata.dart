import 'package:supermedia/layers/data/models/media_metadata_model.dart';

class MediaMetadata {
  final String mediaId;
  final MediaType type;
  final String title;
  final String imageUrl;
  final Map<MediaProperty, String> properties;

  MediaMetadata({
    required this.mediaId,
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.properties,
  });

  factory MediaMetadata.fromModel(MediaMetadataModel model) {
    return MediaMetadata(
      mediaId: model.mediaId,
      type: _parseMediaType(model.type),
      title: model.title,
      imageUrl: model.imageUrl,
      properties: _parseMediaProperties(model.properties),
    );
  }

  static final _mediaTypeMap = {
    'movie': MediaType.movie,
    'music': MediaType.music,
    'book': MediaType.book,
    'podcast': MediaType.podcast,
  };

  static MediaType _parseMediaType(String typeString) {
    return _mediaTypeMap[typeString.toLowerCase()] ??
        (throw ArgumentError('Unsupported media type: $typeString'));
  }

  static final _propertyMap = {
    'pages': MediaProperty.pages,
    'publishDate': MediaProperty.publishDate,
    'genre': MediaProperty.genre,
    'director': MediaProperty.director,
    'productionYear': MediaProperty.productionYear,
    'writer': MediaProperty.writer,
    'duration': MediaProperty.duration,
    'style': MediaProperty.style,
    'singer': MediaProperty.singer,
    'producer': MediaProperty.producer,
  };

  static MediaProperty _parseMediaProperty(String propertyKey) {
    return _propertyMap[propertyKey] ??
        (throw ArgumentError('Invalid property key: $propertyKey'));
  }

  static Map<MediaProperty, String> _parseMediaProperties(
      Map<String, String> properties) {
    Map<MediaProperty, String> result = {};
    for (String key in properties.keys) {
      if(key.toLowerCase() != 'director') {
        MediaProperty property = _parseMediaProperty(key);
        result[property] = properties[key]!;
      }
    }
    return result;
  }

  String toText() {
    List<String> lines = [];

    lines.add('Title: $title');
    lines.add('Type: ${_mediaTypeToString(type)}');
    lines.add('Image URL: $imageUrl');

    for (MediaProperty property in properties.keys) {
      lines.add('${_mediaPropertyToString(property)}: ${properties[property]}');
    }

    return lines.join('\n');
  }

  // Helper methods to convert MediaType and MediaProperty to string
  String _mediaTypeToString(MediaType type) {
    switch (type) {
      case MediaType.movie:
        return 'Movie';
      case MediaType.music:
        return 'Music';
      case MediaType.book:
        return 'Book';
      case MediaType.podcast:
        return 'Podcast';
      default:
        throw ArgumentError('Unsupported media type: $type');
    }
  }

  String _mediaPropertyToString(MediaProperty property) {
    switch (property) {
      case MediaProperty.pages:
        return 'Pages';
      case MediaProperty.publishDate:
        return 'Publish Date';
      case MediaProperty.genre:
        return 'Genre';
      case MediaProperty.director:
        return 'Director';
      case MediaProperty.productionYear:
        return 'Production Year';
      case MediaProperty.writer:
        return 'Writer';
      case MediaProperty.duration:
        return 'Duration';
      case MediaProperty.style:
        return 'Style';
      case MediaProperty.singer:
        return 'Singer';
      case MediaProperty.producer:
        return 'Producer';
      default:
        throw ArgumentError('Invalid media property: $property');
    }
  }
}

enum MediaType { music, movie, book, podcast }

extension MediaTypeExtension on MediaType {
  String toJson() {
    switch (this) {
      case MediaType.movie:
        return 'MOVIE';
      case MediaType.music:
        return 'MUSIC';
      case MediaType.book:
        return 'BOOK';
      case MediaType.podcast:
        return 'PODCAST';
      default:
        throw ArgumentError('Unsupported media type value: $this');
    }
  }
}

enum MediaProperty {
  pages,
  publishDate,
  genre,
  director,
  productionYear,
  writer,
  duration,
  style,
  singer,
  producer,
}
