/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/calendar.svg');

  /// File path: assets/icons/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/icons/facebook.svg');

  /// File path: assets/icons/film.svg
  SvgGenImage get film => const SvgGenImage('assets/icons/film.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/line.svg
  SvgGenImage get line => const SvgGenImage('assets/icons/line.svg');

  /// File path: assets/icons/paper.svg
  SvgGenImage get paper => const SvgGenImage('assets/icons/paper.svg');

  /// File path: assets/icons/twitter.svg
  SvgGenImage get twitter => const SvgGenImage('assets/icons/twitter.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [calendar, facebook, film, google, line, paper, twitter];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  $AssetsImagesCategoriesGen get categories =>
      const $AssetsImagesCategoriesGen();

  /// File path: assets/images/default_category.png
  AssetGenImage get defaultCategory =>
      const AssetGenImage('assets/images/default_category.png');

  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
  $AssetsImagesItemGen get item => const $AssetsImagesItemGen();
  $AssetsImagesItemsGen get items => const $AssetsImagesItemsGen();
  $AssetsImagesPostsGen get posts => const $AssetsImagesPostsGen();
  $AssetsImagesStoriesGen get stories => const $AssetsImagesStoriesGen();

  /// List of all assets
  List<AssetGenImage> get values => [appIcon, defaultCategory];
}

class $AssetsImagesCategoriesGen {
  const $AssetsImagesCategoriesGen();

  /// File path: assets/images/categories/ebookCategory.png
  AssetGenImage get ebookCategory =>
      const AssetGenImage('assets/images/categories/ebookCategory.png');

  /// File path: assets/images/categories/movieCategory.png
  AssetGenImage get movieCategory =>
      const AssetGenImage('assets/images/categories/movieCategory.png');

  /// File path: assets/images/categories/musicCategory.png
  AssetGenImage get musicCategory =>
      const AssetGenImage('assets/images/categories/musicCategory.png');

  /// File path: assets/images/categories/podcastCategory.png
  AssetGenImage get podcastCategory =>
      const AssetGenImage('assets/images/categories/podcastCategory.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [ebookCategory, movieCategory, musicCategory, podcastCategory];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/book_icon.png
  AssetGenImage get bookIcon =>
      const AssetGenImage('assets/images/icons/book_icon.png');

  /// File path: assets/images/icons/movie_icon.png
  AssetGenImage get movieIcon =>
      const AssetGenImage('assets/images/icons/movie_icon.png');

  /// File path: assets/images/icons/music_icon.png
  AssetGenImage get musicIcon =>
      const AssetGenImage('assets/images/icons/music_icon.png');

  /// File path: assets/images/icons/podcast_icon.png
  AssetGenImage get podcastIcon =>
      const AssetGenImage('assets/images/icons/podcast_icon.png');

  /// File path: assets/images/icons/profile_icon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/images/icons/profile_icon.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bookIcon, movieIcon, musicIcon, podcastIcon, profileIcon];
}

class $AssetsImagesItemGen {
  const $AssetsImagesItemGen();

  /// File path: assets/images/item/item.png
  AssetGenImage get item => const AssetGenImage('assets/images/item/item.png');

  /// List of all assets
  List<AssetGenImage> get values => [item];
}

class $AssetsImagesItemsGen {
  const $AssetsImagesItemsGen();

  /// File path: assets/images/items/item.png
  AssetGenImage get item => const AssetGenImage('assets/images/items/item.png');

  /// List of all assets
  List<AssetGenImage> get values => [item];
}

class $AssetsImagesPostsGen {
  const $AssetsImagesPostsGen();

  /// File path: assets/images/posts/post_1.png
  AssetGenImage get post1 =>
      const AssetGenImage('assets/images/posts/post_1.png');

  /// File path: assets/images/posts/post_2.png
  AssetGenImage get post2 =>
      const AssetGenImage('assets/images/posts/post_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [post1, post2];
}

class $AssetsImagesStoriesGen {
  const $AssetsImagesStoriesGen();

  /// File path: assets/images/stories/story_1.jpg
  AssetGenImage get story1 =>
      const AssetGenImage('assets/images/stories/story_1.jpg');

  /// File path: assets/images/stories/story_2.jpg
  AssetGenImage get story2 =>
      const AssetGenImage('assets/images/stories/story_2.jpg');

  /// File path: assets/images/stories/story_3.jpg
  AssetGenImage get story3 =>
      const AssetGenImage('assets/images/stories/story_3.jpg');

  /// File path: assets/images/stories/story_4.jpg
  AssetGenImage get story4 =>
      const AssetGenImage('assets/images/stories/story_4.jpg');

  /// File path: assets/images/stories/story_5.jpg
  AssetGenImage get story5 =>
      const AssetGenImage('assets/images/stories/story_5.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [story1, story2, story3, story4, story5];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
