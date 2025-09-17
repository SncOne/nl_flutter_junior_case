import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';

class CustomTextFormField extends HookWidget {
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int? maxLength;
  final bool showVisibilityToggle;
  final bool readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.maxLength,
    this.showVisibilityToggle = false,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderRadius = 12.0,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final isObscured = useState(obscureText);
    final isFocused = useState(false);
    final errorText = useState<String?>(null);

    final localFocusNode = useFocusNode();
    final activeFocusNode = focusNode ?? localFocusNode;

    useEffect(() {
      void onFocusChange() {
        isFocused.value = activeFocusNode.hasFocus;
      }

      activeFocusNode.addListener(onFocusChange);
      return () => activeFocusNode.removeListener(onFocusChange);
    }, [activeFocusNode]);

    Color getBorderColor() {
      if (errorText.value != null) {
        return errorBorderColor ?? AppColors.primary;
      }
      if (isFocused.value) {
        return focusedBorderColor ?? AppColors.primary;
      }
      return borderColor ?? const Color(0xFF4A5568);
    }

    void toggleVisibility() {
      isObscured.value = !isObscured.value;
    }

    Widget? buildSuffixIcon() {
      if (showVisibilityToggle && obscureText) {
        return ExcludeFocus(
          excluding: true,
          child: AppButton(
            rightIcon: isObscured.value
                ? AppIcons.obsecureHide
                : AppIcons.obsecureShow,
            iconColor: AppColors.white30,
            isFilled: false,
            onPressed: toggleVisibility,
          ),
        );
      }
      return suffixIcon;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: activeFocusNode,
          keyboardType: keyboardType,
          obscureText: isObscured.value,
          textInputAction: textInputAction ?? TextInputAction.done,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          onSaved: onSaved,

          validator: (value) {
            final error = validator?.call(value);
            errorText.value = error;
            return errorText.value;
          },
          errorBuilder: (context, errorText) {
            return Text(
              errorText,
              style: TextStyle(
                fontSize: 12,
                color: errorBorderColor ?? Colors.red,
              ),
            );
          },
          style: AppTextStyles.bodyNormal(color: AppColors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyNormal(color: AppColors.white),
            prefixIcon: prefixIcon,
            suffixIcon: buildSuffixIcon(),
            filled: true,

            fillColor: fillColor ?? const Color(0xFF2D3748),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: getBorderColor(), width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: getBorderColor(), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: getBorderColor(), width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor ?? Colors.red,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor ?? Colors.red,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
