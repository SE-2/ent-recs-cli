import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_bloc.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_event.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_state.dart';
import 'package:supermedia/layers/presentation/media/widgets/media_bottom_bar.dart';
import 'package:supermedia/layers/presentation/media/widgets/media_image.dart';
import 'package:supermedia/layers/presentation/media/widgets/show_more_text.dart';
import 'package:supermedia/layers/presentation/shared/widgets/custom_app_bar.dart';

class ShowMediaScreen extends StatefulWidget {
  static const String route = '/show_media';
  final String? id;

  const ShowMediaScreen({super.key, required this.id});

  @override
  State<ShowMediaScreen> createState() => _ShowMediaScreenState();
}

class _ShowMediaScreenState extends State<ShowMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MediaBloc>(
      create: (_) => locator<MediaBloc>(),
      child: MediaForm(
        id: widget.id!,
      ),
    );
  }
}

class MediaForm extends StatefulWidget {
  final String id;

  const MediaForm({super.key, required this.id});

  @override
  State<MediaForm> createState() => _MediaFormState();
}

class _MediaFormState extends State<MediaForm> {
  bool _isLiked = false;
  late MediaMetadata metadata;

  int _likes = 0;

  void _onLikePressed(String mediaId) {
    setState(() {
      if (_isLiked) {
        _likes--;
      } else {
        // context.read<MediaBloc>().add(LikeButtonPressed(mediaId));
        _likes++;
      }
      _isLiked = !_isLiked;
    });
  }

  void _onBookmarkPressed() {
    // TODO: Implement bookmark button logic
  }

  void _onSharePressed() {
    Share.share(metadata.toText());
  }

  @override
  void initState() {
    super.initState();
    context.read<MediaBloc>().add(LoadMedia(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MediaBloc, MediaState>(listener: (context, state) {
      if (state is MediaLiked) {
        setState(() {
          _likes = state.likes;
        });
      }
    }, child: BlocBuilder<MediaBloc, MediaState>(builder: (context, state) {
      if (state is MediaLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is MediaSuccess) {
        metadata = state.result.data;
        return showContent(state.result);
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }

  SafeArea showContent(MediaMetadataDetail media) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(
          title: 'Media Detail',
          showBackButton: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                MediaImage(
                  imageUrl: media.data.imageUrl,
                ),
                const SizedBox(
                  height: 6,
                ),
                MediaBottomBar(
                  likes: _likes,
                  isLiked: _isLiked,
                  onBookmarkPressed: _onBookmarkPressed,
                  onLikePressed: () {
                    _onLikePressed(media.data.mediaId);
                  },
                  onSharePressed: _onSharePressed,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
                      child: Text(
                        media.data.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.outline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: SizedBox(
                        height: 17,
                        width: 292,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [..._buildMediaProperties()],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ShowMoreText(
                            text: media.decoration,
                            maxLength: 99,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMediaProperties() {
    return List.generate(
      metadata.properties.entries.length,
      (index) {
        final entry = metadata.properties.entries.elementAt(index);
        return Row(
          children: [
            Icon(
              _getIconForProperty(entry.key),
              size: 16,
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 50,
              child: Text(
                entry.value,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        );
      },
    );
  }

  static IconData _getIconForProperty(MediaProperty property) {
    switch (property) {
      case MediaProperty.pages:
        return Icons.menu_book;
      case MediaProperty.publishDate:
        return Icons.calendar_today;
      case MediaProperty.genre:
        return Icons.category;
      case MediaProperty.director:
        return Icons.movie_filter;
      case MediaProperty.productionYear:
        return Icons.date_range;
      case MediaProperty.writer:
        return Icons.create;
      case MediaProperty.duration:
        return Icons.timer;
      case MediaProperty.style:
        return Icons.music_note;
      case MediaProperty.singer:
        return Icons.mic;
      case MediaProperty.producer:
        return Icons.mic_none;
    }
  }
}
