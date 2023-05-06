import 'package:supermedia/layers/domain/entities/book.dart';
import 'package:supermedia/layers/domain/entities/movie.dart';
import 'package:supermedia/layers/domain/entities/music.dart';
import 'package:supermedia/layers/domain/entities/podcast.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';

class SearchUseCaseImpl implements SearchUseCase {
  @override
  Future<List> search(String query) async {
    return entitiesList;
  }
}

List<dynamic> entitiesList = [
  Book(
    bookId: '1',
    title: 'The Great Gatsby',
    imageUrl: 'https://images.gr-assets.com/books/1490528560l/4671.jpg',
    url: 'https://www.goodreads.com/book/show/4671.The_Great_Gatsby',
    numPages: 180,
    ratingsCount: 4321802,
    description:
        'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway\'s interactions with mysterious millionaire Jay Gatsby and Gatsby\'s obsession to reunite with his former lover, Daisy Buchanan.',
    genre: 'Fiction',
    name: 'F. Scott Fitzgerald',
    bookIdMapping: 123,
  ),
  Movie(
    posterLink:
        'https://upload.wikimedia.org/wikipedia/en/0/03/The_Godfather_Part_II.jpg',
    seriesTitle: 'The Godfather',
    releasedYear: 1974,
    certificate: 'R',
    runtime: '3h 22min',
    genre: 'Crime, Drama',
    imdbRating: 9.0,
    overview:
        'The continuing saga of the Corleone crime family tells the story of a young Vito Corleone growing up in Sicily and in 1910s New York; and follows Michael Corleone in the 1950s as he attempts to expand the family business into Las Vegas, Hollywood and Cuba.',
    metaScore: 90,
    director: 'Francis Ford Coppola',
    star1: 'Al Pacino',
    star2: 'Robert De Niro',
    star3: 'Robert Duvall',
    star4: 'Diane Keaton',
    numOfVotes: 1147891,
    gross: '\$57.30M',
  ),
  Music(
    id: '1',
    artist: 'The Beatles',
    urlSpotify: 'https://open.spotify.com/artist/3WrFJ7ztbogyGnTHbHJFl2',
    track: 'Let It Be',
    album: 'Let It Be',
    albumType: 'Album',
    uri: 'spotify:track:0BQIeZJ4ch4uRk61EXhEB6',
    danceability: 0.528,
    energy: 0.352,
    key: 0,
    loudness: -10.934,
    speechiness: 0.0279,
    acousticness: 0.236,
    instrumentalness: 3.46e-05,
    liveness: 0.11,
    valence: 0.151,
    tempo: 79.483,
    durationMs: 243027,
    urlYoutube: 'https://www.youtube.com/watch?v=2xDzVZcqtYI',
    title: 'Let It Be (Remastered 2009)',
    channel: 'The Beatles',
    views: 105899218,
    likes: 639972,
    comments: 18134,
    description:
        'The Beatles 1 Video Collection is Out Now. Get your copy here: http://thebeatles1.lnk.to/DeluxeBluRay "When I find myself in times of trouble Mother Mary comes to me Speaking words of wisdom, let it be. ',
    licensed: true,
    officialVideo: true,
    stream: true,
  ),
  Podcast(
    title: 'Serial',
    producer: 'This American Life',
    genre: 'True Crime',
    description:
        'Serial is a podcast from the creators of This American Life, hosted by Sarah Koenig. Serial tells one story—a true story—over the course of a season. Each season, we follow a plot and characters wherever they take us. We won’t know what happens at the end until we get there, not long before you get there with us.',
    numEpisodes: 12,
    rating: 4.7,
    numReviews: 13508,
    link: 'https://serialpodcast.org/',
    id: '1',
  ),
];
