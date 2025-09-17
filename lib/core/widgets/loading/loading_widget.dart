import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_anims.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends HookWidget {
  const LoadingWidget({
    super.key,
    this.size = 32,
    this.color = AppColors.primary,
  });
  final double size;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    return Lottie.asset(
      AppAnims.loading,
      width: size,
      height: size,
      fit: BoxFit.cover,
      repeat: true,
    );
  }
}
