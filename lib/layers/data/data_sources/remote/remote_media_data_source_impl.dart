import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';

class RemoteMediaDataSourceImpl implements RemoteMediaDataSource {
  final IHttpClient _httpClient = locator<IHttpClient>();

  @override
  Future<List<MediaMetadataModel>> search(SearchQuery query) async {
    // final request = HttpRequest(
    //   '/search',
    //   headers: {'Content-Type': 'application/json'},
    //   body: {'query': query},
    // );
    //
    // final response = await _httpClient.post(request);
    //
    // if (response.statusCode == 200) {
    //   return MediaMetadataModel.fromJsonList(response.body);
    // } else {
    //   throw SearchException(
    //       AppLocalization.instance.errorCode(response.statusCode));
    // }

    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> recommend() async {
    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> getAllTimesTrendMedia() async {
    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> getRecentWatchedMedia() async {
    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> getTodayTrendMedia() async {
    return mediaList;
  }

  @override
  Future<List<MediaFilter>> getMediaFilters() async {
    return mediaFilterList;
  }
}

List<MediaFilter> mediaFilterList = [
  MediaFilter(mediaType: MediaType.music, categories: ['Rock', 'Hip Hop', 'Jazz', 'Pop', 'Classical']),
  MediaFilter(mediaType: MediaType.movie, categories: ['Action', 'Comedy', 'Drama', 'Horror', 'Romance']),
  MediaFilter(mediaType: MediaType.book, categories: ['Fiction', 'Non-Fiction', 'Mystery', 'Thriller', 'Romance']),
  MediaFilter(mediaType: MediaType.podcast, categories: ['News', 'Technology', 'Comedy', 'True Crime', 'Sports'])
];

List<MediaMetadataModel> mediaList = [
  MediaMetadataModel(
    "m1",
    "Movie",
    "The Shawshank Redemption",
    "https://images.pathe-thuis.nl/23470_450x640.jpg",
    {"director": "Frank Darabont", "genre": "Drama", "productionYear": "1994"},
  ),
  MediaMetadataModel(
    "b1",
    "Book",
    "To Kill a Mockingbird",
    "https://encyclopediaofalabama.org/wp-content/uploads/2023/02/m-2908.jpg",
    {"writer": "Harper Lee", "genre": "Classic", "pages": "281"},
  ),
  MediaMetadataModel(
    "mu1",
    "Music",
    "Stairway to Heaven",
    "https://upload.wikimedia.org/wikipedia/commons/4/4b/Stairway_to_Heaven_by_Led_Zeppelin_US_promotional_single.png",
    {"duration": "8:02", "style": "Rock", "singer": "Led Zeppelin"},
  ),
  MediaMetadataModel(
    "p1",
    "Podcast",
    "Serial",
    "https://ww2.kqed.org/app/uploads/sites/23/2015/03/Serial-iPhone.jpg",
    {
      "duration": "30-60 minutes",
      "producer": "Sarah Koenig",
      "genre": "True Crime"
    },
  ),
  MediaMetadataModel(
    "m2",
    "Movie",
    "The Godfather",
    "https://static.wikia.nocookie.net/godfather/images/4/47/The_Godfather.jpg/revision/latest?cb=20100520182354",
    {
      "director": "Francis Ford Coppola",
      "genre": "Crime",
      "productionYear": "1972"
    },
  ),
  MediaMetadataModel(
    "b2",
    "Book",
    "1984",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgXnem1GNKWsgULAIZQUB7xpO7mVJfhnxBcsBbxA23XTi7YbjOmo_MPn-V___4sQWEy7g&usqp=CAU",
    {"writer": "George Orwell", "genre": "Dystopian Fiction", "pages": "328"},
  ),
  MediaMetadataModel(
    "mu2",
    "Music",
    "Bohemian Rhapsody",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQza68ybLR0U3OtZOsMQZLdRQVbc0hY4yDasylKwbP0t4zXlQ0QOqQFu6zchSiOQ3P_SaQ&usqp=CAU",
    {"duration": "5:55", "style": "Rock", "singer": "Queen"},
  ),
  MediaMetadataModel(
    "p2",
    "Podcast",
    "Criminal",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx589hbcxbKw4xZ3PtQHEhr5wlU_c7dGkfr9pTglEP9eQJsN1MeA_qUljTCNdT863ojiQ&usqp=CAU",
    {
      "duration": "20-45 minutes",
      "producer": "Phoebe Judge",
      "genre": "True Crime"
    },
  ),
  MediaMetadataModel(
    "m3",
    "Movie",
    "The Dark Knight",
    "https://soundvapors.com/wp-content/uploads/2020/06/The-Dark-Knight-Rises-830x1245.jpg",
    {
      "director": "Christopher Nolan",
      "genre": "Action",
      "productionYear": "2008"
    },
  ),
  MediaMetadataModel(
    "b3",
    "Book",
    "The Catcher in the Rye",
    "https://kbimages1-a.akamaihd.net/264004f8-0018-4ec9-a503-eb3a686cb26e/353/569/90/False/j-d-salinger-s-the-catcher-in-the-rye-4.jpg",
    {"writer": "J.D. Salinger", "genre": "Classic", "pages": "277"},
  )
];
