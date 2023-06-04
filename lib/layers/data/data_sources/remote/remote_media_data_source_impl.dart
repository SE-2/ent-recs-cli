import 'package:supermedia/common/exceptions/search_exception.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model_details.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';

class RemoteMediaDataSourceImpl implements RemoteMediaDataSource {
  final IHttpClient _httpClient = locator<IHttpClient>();

  @override
  Future<List<MediaMetadataModel>> search(SearchQuery query) async {
    final request = HttpRequest(
      '/search',
      body: query.toJson(),
      token: '1',
    );

    try {
      final response = await _httpClient.post(request);

      if (response.statusCode == 200) {
        return MediaMetadataModel.fromJsonList(response.body);
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception {
      throw SearchException('Check your internet connection.');
    }
  }

  @override
  Future<List<MediaMetadataModel>> recommend(MediaType mediaType) async {
    final request = HttpRequest(
      '/recommend',
      body: '"${mediaType.toJson()}"',
      token: '1',
    );

    try {
      final response = await _httpClient.post(request);

      if (response.statusCode == 200) {
        return MediaMetadataModel.fromJsonList(response.body);
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception {
      throw SearchException('Check your internet connection.');
    }
  }

  @override
  Future<List<MediaMetadataModel>> getAllTimesTrendMedia() async {
    final request = HttpRequest(
      '/trends/all',
      body: '',
      token: '1',
    );

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode == 200) {
        var result = MediaMetadataModel.fromJsonList(response.body);
        return result.isEmpty ? mediaList : result;
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception catch (e) {}

    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> getRecentWatchedMedia() async {
    final request = HttpRequest(
      '/trends/today',
      body: '',
      token: '1',
    );

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode == 200) {
        var result = MediaMetadataModel.fromJsonList(response.body);
        return result.isEmpty ? mediaList : result;
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception catch (e) {}

    return mediaList;
  }

  @override
  Future<List<MediaMetadataModel>> getTodayTrendMedia() async {
    final request = HttpRequest(
      '/trends/today',
      body: '',
      token: '1',
    );

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode == 200) {
        var result = MediaMetadataModel.fromJsonList(response.body);
        return result.isEmpty ? mediaList : result;
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception catch (e) {}

    return mediaList;
  }

  String getMediaTypeById(String id) {
    if (id.startsWith('M')) {
      return 'movie';
    } else if (id.startsWith('P')) {
      return 'podcast';
    } else if (id.startsWith('S')) {
      return 'music';
    } else if (id.startsWith('B')) {
      return 'book';
    } else {
      return 'book';
    }
  }

  @override
  Future<MediaMetadataDetailsModel> getMediaById(String id) async {
    final request = HttpRequest(
      '/${getMediaTypeById(id)}/{$id}',
      token: '1',
    );

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode == 200) {
        return MediaMetadataDetailsModel.fromJson(response.body);
      } else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode));
      }
    } on Exception catch (e) {}

    for (var element in mediaDetailList) {
      if (element.model.mediaId == id) return element;
    }
    return mediaDetailList[0];
  }

  @override
  Future<List<MediaFilter>> getMediaFilters() async {
    return mediaFilterList;
  }
}

List<MediaFilter> mediaFilterList = [
  MediaFilter(
      mediaType: MediaType.music,
      categories: ['Rock', 'Hip Hop', 'Jazz', 'Pop', 'Classical']),
  MediaFilter(
      mediaType: MediaType.movie,
      categories: ['Animation', 'History', 'War', 'Family', 'Mystery',
        'Action', 'Crime', 'Sport', 'Romance',
        'Adventure', 'Fantasy', 'Horror', 'Drama', 'Comedy',  'Western']),
  MediaFilter(
      mediaType: MediaType.book,
      categories: ['young-adult', 'poetry', 'children', 'romance',
        'comics, graphic', 'fiction']),
  MediaFilter(
      mediaType: MediaType.podcast,
      categories: ['Sports', 'Business',
        'Education', 'History', 'Science', 'Health & Fitness', 'News', 'Arts',
        'Society & Culture',  'Comedy', 'True Crime',
        'Fiction', 'Leisure', 'Technology'])
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

List<MediaMetadataDetailsModel> mediaDetailList = [
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "m1",
        "Movie",
        "The Shawshank Redemption",
        "https://images.pathe-thuis.nl/23470_450x640.jpg",
        {
          "director": "Frank Darabont",
          "genre": "Drama",
          "productionYear": "1994"
        },
      ),
      decoration:
          "Shawshank Redemption is an American drama film written and directed by Frank Darabont and based on the short novel by Rita Hayworth and Shawshank Redemption written by Stephen King, which was published in 1994."),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "b1",
        "Book",
        "To Kill a Mockingbird",
        "https://encyclopediaofalabama.org/wp-content/uploads/2023/02/m-2908.jpg",
        {"writer": "Harper Lee", "genre": "Classic", "pages": "281"},
      ),
      decoration:
          "To Kill a Mockingbird or To Kill a Mockingbird is a novel written by American author Harper Lee in 1960. He won the Pulitzer Prize for writing this novel in 1964. Since its first publication, more than 40 million copies of this book have been sold and translated into more than 40 international languages."),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "mu1",
        "Music",
        "Stairway to Heaven",
        "https://upload.wikimedia.org/wikipedia/commons/4/4b/Stairway_to_Heaven_by_Led_Zeppelin_US_promotional_single.png",
        {"duration": "8:02", "style": "Rock", "singer": "Led Zeppelin"},
      ),
      decoration:
          "Stairway to Heaven is a song by the British rock band Led Zeppelin, which was released in 1971 on their fourth studio album, Led Zeppelin IV. It is widely regarded as one of the greatest and most influential rock songs of all time, and has been covered by numerous artists."),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
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
      decoration:
          "Serial is a podcast that presents investigative journalism in a serialized format. The podcast first aired in 2014 and is produced by Sarah Koenig and Julie Snyder of This American Life. Each season of the podcast focuses on a different true crime story, with Koenig serving as the narrator and reporter.The podcast has gained widespread critical acclaim for its in-depth reporting, compelling storytelling, and groundbreaking use of the podcast medium. The first season of Serial focused on the murder of a high school student in Baltimore, Maryland, and the subsequent trial and conviction of her ex-boyfriend. The podcast's investigation raised questions about the evidence used in the case and the reliability of witness testimony, and sparked widespread public discussion and debate.Subsequent seasons of the podcast have focused on a range of topics, including the case of an American soldier who deserted his post in Afghanistan, the criminal justice system in Cleveland, Ohio, and the impact of climate change on a small town in Alabama.Serial is widely regarded as one of the most influential and groundbreaking podcasts of all time, and has helped to popularize the true crime genre in podcasting."),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
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
      decoration: ""),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "b2",
        "Book",
        "1984",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgXnem1GNKWsgULAIZQUB7xpO7mVJfhnxBcsBbxA23XTi7YbjOmo_MPn-V___4sQWEy7g&usqp=CAU",
        {
          "writer": "George Orwell",
          "genre": "Dystopian Fiction",
          "pages": "328"
        },
      ),
      decoration: ""),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "mu2",
        "Music",
        "Bohemian Rhapsody",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQza68ybLR0U3OtZOsMQZLdRQVbc0hY4yDasylKwbP0t4zXlQ0QOqQFu6zchSiOQ3P_SaQ&usqp=CAU",
        {"duration": "5:55", "style": "Rock", "singer": "Queen"},
      ),
      decoration: ""),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
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
      decoration: ""),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
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
      decoration: ""),
  MediaMetadataDetailsModel(
      model: MediaMetadataModel(
        "b3",
        "Book",
        "The Catcher in the Rye",
        "https://kbimages1-a.akamaihd.net/264004f8-0018-4ec9-a503-eb3a686cb26e/353/569/90/False/j-d-salinger-s-the-catcher-in-the-rye-4.jpg",
        {"writer": "J.D. Salinger", "genre": "Classic", "pages": "277"},
      ),
      decoration: "")
];
