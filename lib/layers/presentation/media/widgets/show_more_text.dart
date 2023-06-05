import 'package:flutter/material.dart';

class ShowMoreText extends StatefulWidget {
  final String text;
  final int maxLength;

  const ShowMoreText({super.key, required this.text, required this.maxLength});

  @override
  ShowMoreTextState createState() => ShowMoreTextState();
}

class ShowMoreTextState extends State<ShowMoreText> {
  bool _showAllText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _showAllText
              ? widget.text
              : widget.text.substring(0, widget.maxLength),
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        GestureDetector(
          child: Text(_showAllText ? 'Show less' : 'Show more',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            setState(() {
              _showAllText = !_showAllText;
            });
          },
        ),
      ],
    );
  }
}
