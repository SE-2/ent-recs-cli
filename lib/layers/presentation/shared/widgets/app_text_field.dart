import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String label;

  const AppTextField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  bool _isFocused = false;
  final TextEditingController _textController = TextEditingController();

  String get text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF78828a),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 52,
          width: containerWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
              color: _isFocused
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          child: Expanded(
            child: TextField(
              showCursor: _isFocused,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 16),
              controller: _textController,
              onTap: () {
                setState(() {
                  _isFocused = true;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  _isFocused = false;
                });
              },
              onTapOutside: (value) {
                setState(() {
                  _isFocused = false;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
