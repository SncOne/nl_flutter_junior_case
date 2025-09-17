import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

enum OverlayType { success, info, error }

class CustomOverlay {
  static void show(
    BuildContext context, {
    required String message,
    OverlayType type = OverlayType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (_) =>
          _OverlayContent(message: message, type: type, duration: duration),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

class _OverlayContent extends HookWidget {
  final String message;
  final OverlayType type;
  final Duration duration;

  const _OverlayContent({
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 3),
  });

  Color _backgroundColor() {
    switch (type) {
      case OverlayType.success:
        return AppColors.success;
      case OverlayType.error:
        return AppColors.error;
      case OverlayType.info:
        return AppColors.info;
    }
  }

  IconData _icon() {
    switch (type) {
      case OverlayType.success:
        return Icons.check_circle;
      case OverlayType.error:
        return Icons.error;
      case OverlayType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );
    final offsetAnim = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    final opacityAnim = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    useEffect(() {
      controller.forward();
      return null;
    }, []);

    return Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: offsetAnim,
        child: FadeTransition(
          opacity: opacityAnim,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _backgroundColor(),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(_icon(), color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: AppTextStyles.bodyNormal(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
