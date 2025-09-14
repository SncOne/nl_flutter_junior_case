import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';

class AuthRichText extends StatelessWidget {
  final String? prefixText;
  final String? actionText;
  final VoidCallback? actionOnTap;
  final bool? isUnderlined;
  final String? suffixText;
  const AuthRichText({
    super.key,
    this.prefixText,
    this.actionText,
    this.actionOnTap,
    this.suffixText,
    this.isUnderlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixText ?? '',
        style: AppTextStyles.bodySmall(color: Colors.white70),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: actionOnTap,
              child: Text(
                actionText ?? '',
                style: AppTextStyles.bodySmall(color: Colors.white).copyWith(
                  decoration: isUnderlined == true
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          TextSpan(
            text: suffixText ?? '',
            style: AppTextStyles.bodySmall(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
