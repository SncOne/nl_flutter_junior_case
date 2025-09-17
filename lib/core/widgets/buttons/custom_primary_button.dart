import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;

  // Stil seçenekleri
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color textColor;
  final Color disabledColor;
  final double borderRadius;
  final Color borderColor;
  final double elevation;
  final bool isFilled;

  // Icon seçenekleri
  final String? leftIcon;
  final String? rightIcon;
  final double iconSize;
  final Color? iconColor;

  // Durumlar
  final bool isDisabled;
  final bool isLoading;

  // Circular option
  final bool isCircular;
  final double circularSize;

  const AppButton({
    super.key,
    this.label,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.disabledColor = Colors.grey,
    this.borderRadius = 12,
    this.borderColor = Colors.transparent,
    this.elevation = 0,
    this.isFilled = true,
    this.leftIcon,
    this.rightIcon,
    this.iconSize = 20,
    this.iconColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.isCircular = false,
    this.circularSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = (isDisabled || isLoading) ? null : onPressed;

    final buttonPadding = isCircular ? EdgeInsets.zero : padding;

    return ElevatedButton(
      onPressed: effectiveOnPressed,
      style: ElevatedButton.styleFrom(
        padding: buttonPadding,
        side: BorderSide(color: borderColor),
        disabledBackgroundColor: disabledColor,
        disabledForegroundColor: textColor.withValues(alpha: 0.5),

        backgroundColor: isFilled ? backgroundColor : Colors.transparent,
        foregroundColor: textColor,
        elevation: elevation,

        shape: isCircular
            ? CircleBorder(side: BorderSide(color: borderColor))
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
        fixedSize: isCircular ? Size(circularSize, circularSize) : null,
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: textColor,
                strokeWidth: 2,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leftIcon != null)
                  Image.asset(
                    leftIcon!,
                    height: iconSize,
                    width: iconSize,
                    color: iconColor ?? textColor,
                  ),
                if (label != null) ...[
                  if (leftIcon != null) const SizedBox(width: 8),
                  Text(label!),
                ],
                if (rightIcon != null) ...[
                  if (label != null) const SizedBox(width: 8),
                  Image.asset(
                    rightIcon!,
                    height: iconSize,
                    width: iconSize,
                    color: iconColor ?? textColor,
                  ),
                ],
              ],
            ),
    );
  }
}
