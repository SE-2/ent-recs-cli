import 'package:flutter/material.dart';

class CenterScreenMessage extends StatelessWidget {
  final String message;

  const CenterScreenMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}