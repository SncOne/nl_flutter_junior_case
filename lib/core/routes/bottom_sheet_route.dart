import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomSheetPageRoute<T> extends CustomRoute<T> {
  BottomSheetPageRoute({
    required super.page,
    super.path,
    super.keepHistory,
    super.initial,
    super.children,
    super.meta,
    super.usesPathAsKey,
    super.fullscreenDialog,
    super.fullMatch,
    super.customRouteBuilder = _customRouteBuilder,
  });

  static Route<T> _customRouteBuilder<T>(
    final BuildContext context,
    final Widget child,
    final AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      opaque: false,
      barrierColor: Colors.black54,
      barrierDismissible: true,
    );
  }
}
