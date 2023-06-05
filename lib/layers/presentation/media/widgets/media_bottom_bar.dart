import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MediaBottomBar extends StatefulWidget {
  final int likes;
  final bool isLiked;
  final VoidCallback onLikePressed;
  final VoidCallback onBookmarkPressed;
  final VoidCallback onSharePressed;

  const MediaBottomBar({
    super.key,
    required this.likes,
    required this.isLiked,
    required this.onLikePressed,
    required this.onBookmarkPressed,
    required this.onSharePressed,
  });

  @override
  MediaBottomBarState createState() => MediaBottomBarState();
}

class MediaBottomBarState extends State<MediaBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 224.1,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Like Button
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: IconButton(
              onPressed: widget.onLikePressed,
              icon: Icon(
                widget.isLiked ? Icons.favorite : Icons.favorite_border,
                color: widget.isLiked
                    ? Colors.red
                    : Theme.of(context).colorScheme.outline,
                size: 21,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 3, 0),
            child: Text(
              '${widget.likes}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: widget.isLiked
                      ? Colors.red
                      : Theme.of(context).colorScheme.outline,
                  fontSize: 12,
                  fontWeight:
                      widget.isLiked ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          const SizedBox(width: 10),
          // Share Button
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 13, 0, 0),
            child: InkWell(
              onTap:  widget.onSharePressed,
              child: Transform.rotate(
                angle: -45 * math.pi / 180,
                child: Icon(
                  Icons.send_rounded,
                  color: Theme.of(context).colorScheme.outline,
                  size: 18,
                ),
              ),
            ),
          ),
          // Bookmark Button
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: IconButton(
              onPressed: widget.onBookmarkPressed,
              icon: Icon(
                CupertinoIcons.bookmark,
                color: Theme.of(context).colorScheme.outline,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
