class MediaMetadataModel {
  final String mediaId;
  final String type;
  final String title;
  final String imageUrl;
  final Map<String, String> properties;

  MediaMetadataModel(
      this.mediaId, this.type, this.title, this.imageUrl, this.properties);

  factory MediaMetadataModel.fromJson(Map<String, dynamic> json) {
    final properties = Map<String, String>.from(json['properties']);
    return MediaMetadataModel(
      json['mediaId'] as String,
      json['type'] as String,
      json['title'] as String,
      json['imageUrl'] as String,
      properties,
    );
  }

  static List<MediaMetadataModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MediaMetadataModel.fromJson(json)).toList();
  }
}
