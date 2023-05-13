import 'package:flutter/material.dart';

class MediaImage extends StatelessWidget {
  final String imageUrl;
  const MediaImage({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 224.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:  DecorationImage(
                image: AssetImage(imageUrl),
                scale: 3),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff7B7B7B).withOpacity(0.25),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ]));
  }
}