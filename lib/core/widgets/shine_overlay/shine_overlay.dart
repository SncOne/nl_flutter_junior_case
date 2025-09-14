import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';

class ShineOverlay extends StatelessWidget {
  const ShineOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width / 2,
        height: 100,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [AppColors.primaryDark, AppColors.primary],
            stops: [0.0, 1.0],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 60, sigmaY: 80),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
