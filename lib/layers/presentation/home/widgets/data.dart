import 'package:flutter/material.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class Story {
  final String id;
  final String name;
  final String imageUrl;
  final String iconFileName;
  final bool isViewed;
  final Category category;

  Story({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.iconFileName,
    required this.isViewed,
    required this.category,
  });

  factory Story.fromMetadata(MediaMetadata metadata) {
    return Story(
      id: metadata.mediaId,
      name: metadata.title,
      imageUrl: metadata.imageUrl,
      iconFileName: getIconFileName(metadata.type),
      isViewed: false,
      category: categories[MediaType.values.indexOf(metadata.type)],
    );
  }
}

enum Category {
  music(
      id: 0,
      color: Color(0xffA8D4B5),
      title: 'Music',
      imageFileName: 'musicCategory.png'),
  movie(
      id: 1,
      color: Color(0xffDBA506),
      title: 'Movie',
      imageFileName: 'movieCategory.png'),
  book(
      id: 2,
      color: Color(0xff6C9EFC),
      title: 'eBook',
      imageFileName: 'ebookCategory.png'),
  podcast(
      id: 3,
      color: Color(0xffFC4604),
      title: 'Podcast',
      imageFileName: 'podcastCategory.png');

  final int id;
  final Color color;
  final String title;
  final String imageFileName;

  const Category(
      {required this.id,
      required this.color,
      required this.title,
      required this.imageFileName});
}

class AppDatabase {
  static List<Story> get stories {
    return [
      Story(
          id: "1001",
          category: Category.book,
          name: 'Sharp objects',
          imageUrl: 'story_1.jpg',
          iconFileName: 'book_icon.png',
          isViewed: false),
      Story(
          id: "1002",
          category: Category.movie,
          name: 'John wick',
          imageUrl: 'story_2.jpg',
          iconFileName: 'movie_icon.png',
          isViewed: false),
      Story(
          id: "1003",
          category: Category.podcast,
          name: 'Mindful Businesses',
          imageUrl: 'story_3.jpg',
          iconFileName: 'podcast_icon.png',
          isViewed: true),
      Story(
          id: "1004",
          category: Category.music,
          name: 'All of the girls you lo...',
          imageUrl: 'story_4.jpg',
          iconFileName: 'music_icon.png',
          isViewed: false),
      Story(
          id: "1005",
          category: Category.book,
          name: 'The Eye of the World',
          imageUrl: 'story_5.jpg',
          iconFileName: 'book_icon.png',
          isViewed: false),
    ];
  }

  static List<Category> get allCategories => categories;
}

String getIconFileName(MediaType mediaType) {
  switch(mediaType) {
    case MediaType.music: return 'music_icon.png';
    case MediaType.movie: return 'movie_icon.png';
    case MediaType.podcast: return 'podcast_icon.png';
    case MediaType.book: return 'book_icon.png';
  }
}

List<Category> get categories {
  return [Category.music, Category.movie, Category.book, Category.podcast];
}
