import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final String icon;
  final String filledIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.filledIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          gradient: isSelected
              ? RadialGradient(
                  center: Alignment(0, -0.6),
                  radius: 1.33,
                  colors: AppColors.activeNavGradient,
                )
              : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.white20),
            borderRadius: BorderRadius.circular(42),
          ),
          shadows: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xffe50914).withValues(alpha: 0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: const Color(0xffe50914).withValues(alpha: 0.2),
                    blurRadius: 40,
                    offset: const Offset(0, 8),
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: AnimatedScale(
          scale: isSelected ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutQuart,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.easeOutQuart,
                switchOutCurve: Curves.easeInQuart,
                child: Image.asset(
                  isSelected ? filledIcon : icon,
                  key: ValueKey(isSelected),
                  width: 24,
                  height: 24,
                  color: isSelected ? AppColors.white : AppColors.white70,
                ),
              ),
              const SizedBox(width: 10),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutQuart,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: isSelected ? 0.3 : 0,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
