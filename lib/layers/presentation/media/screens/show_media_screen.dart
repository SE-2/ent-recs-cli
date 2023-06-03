import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
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

  int _likes = 50;

  void _onLikePressed() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likes++;
      } else {
        _likes--;
      }
    });
  }

  void _onBookmarkPressed() {
    // TODO: Implement bookmark button logic
  }

  void _onSharePressed() {
    // TODO: Implement share button logic
  }

  @override
  Widget build(BuildContext context) {
    context.read<MediaBloc>().add(LoadMedia(widget.id));

    return BlocBuilder<MediaBloc, MediaState>(builder: (context, state) {
      if (state is MediaLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is MediaSuccess) {
        return showContent(context, state.result);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

  SafeArea showContent(BuildContext context, MediaMetadataDetail media) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(
          title: 'Movie Detail',
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
                  isLiked: media.isLiked,
                  onBookmarkPressed: _onBookmarkPressed,
                  onLikePressed: _onLikePressed,
                  onSharePressed: _onSharePressed,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
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
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color(0xff434E58),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '17 Sep 2021',
                                  style: TextStyle(
                                      color: Color(0xff78828A), fontSize: 12),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.time_solid,
                                  color: Color(0xff434E58),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '148 Minutes',
                                  style: TextStyle(
                                      color: Color(0xff78828A), fontSize: 12),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_movies,
                                  color: Color(0xff434E58),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Action',
                                    style: TextStyle(
                                        color: Color(0xff78828A), fontSize: 12),
                                    textAlign: TextAlign.center)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 16,
                    //   width: 104,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: const [
                    //       Icon(CupertinoIcons.star_fill,
                    //           size: 16, color: Color(0xffFACC15)),
                    //       Icon(CupertinoIcons.star_fill,
                    //           size: 16, color: Color(0xffFACC15)),
                    //       Icon(CupertinoIcons.star_fill,
                    //           size: 16, color: Color(0xffFACC15)),
                    //       Icon(CupertinoIcons.star_fill,
                    //           size: 16, color: Color(0xffFACC15)),
                    //       Icon(CupertinoIcons.star_fill,
                    //           size: 16, color: Color(0xff78828A)),
                    //     ],
                    //   ),
                    // ),
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
                            maxLength: 100,
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
}
