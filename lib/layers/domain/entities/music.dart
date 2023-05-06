class Music {
  final String id;
  final String artist;
  final String urlSpotify;
  final String track;
  final String album;
  final String albumType;
  final String uri;
  final double danceability;
  final double energy;
  final int key;
  final double loudness;
  final double speechiness;
  final double acousticness;
  final double instrumentalness;
  final double liveness;
  final double valence;
  final double tempo;
  final int durationMs;
  final String urlYoutube;
  final String title;
  final String channel;
  final int views;
  final int likes;
  final int comments;
  final String description;
  final bool licensed;
  final bool officialVideo;
  final bool stream;

  Music({
    required this.id,
    required this.artist,
    required this.urlSpotify,
    required this.track,
    required this.album,
    required this.albumType,
    required this.uri,
    required this.danceability,
    required this.energy,
    required this.key,
    required this.loudness,
    required this.speechiness,
    required this.acousticness,
    required this.instrumentalness,
    required this.liveness,
    required this.valence,
    required this.tempo,
    required this.durationMs,
    required this.urlYoutube,
    required this.title,
    required this.channel,
    required this.views,
    required this.likes,
    required this.comments,
    required this.description,
    required this.licensed,
    required this.officialVideo,
    required this.stream,
  });
}