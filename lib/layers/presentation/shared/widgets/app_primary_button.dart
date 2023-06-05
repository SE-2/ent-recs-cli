import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Widget? icon;
  final bool _isLoading;
  final double width;
  final bool isEnabled;

  const AppPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width = double.infinity,
    this.isEnabled = true,
  })  : _isLoading = false,
        super(key: key);

  const AppPrimaryButton.loading({
    Key? key,
    this.width = double.infinity,
  })  : text = null,
        icon = null,
        onPressed = null,
        _isLoading = true,
        isEnabled = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: _buttonStyle(context),
          child: _isLoading
          ? CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary)
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
    Color backgroundColor = Theme.of(context).colorScheme.primary;
    Color? foregroundColor = Theme.of(context).colorScheme.onPrimary;
    if (!isEnabled) {
      backgroundColor = Theme.of(context).colorScheme.primary.withOpacity(0.5);
      foregroundColor = Theme.of(context).colorScheme.onPrimary.withOpacity(0.5);
    }
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
      foregroundColor: MaterialStateProperty.all<Color?>(foregroundColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  TextStyle _textStyle(BuildContext context) {
    var color = Theme.of(context).colorScheme.onPrimary;
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w600,
      color: isEnabled ? color : color.withOpacity(0.5),
    );
  }
}
