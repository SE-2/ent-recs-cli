import 'package:flutter/material.dart';

class AppSecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? icon;
  final bool _isLoading;
  final double width;

  const AppSecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.width = double.infinity,
  })  : _isLoading = false,
        super(key: key);

  const AppSecondaryButton.loading({
    Key? key,
    this.width = double.infinity,
  })  : text = null,
        icon = null,
        onPressed = null,
        _isLoading = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56,
      child: ElevatedButton(
          onPressed: onPressed,
          style: _buttonStyle(context),
          child: _isLoading
              ? const CircularProgressIndicator()
              : _buildButtonContent(context)),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) icon!,
        if (icon != null || text != null) const SizedBox(width: 12),
        if (text != null) Text(text!, style: _textStyle(context)),
      ],
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Theme.of(context).colorScheme.background,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }

  TextStyle? _textStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.outline
    );
  }
}