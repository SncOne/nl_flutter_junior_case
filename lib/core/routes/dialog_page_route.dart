import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPageRoute<T> extends CustomRoute<T> {
  DialogPageRoute({
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
    if (Theme.of(context).platform == TargetPlatform.iOS ||
        Theme.of(context).platform == TargetPlatform.macOS) {
      return CupertinoDialogRoute<T>(
        context: context,
        builder: (final _) => child,
        settings: page,
      );
    } else {
      return PageRouteBuilder<T>(
        settings: page,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          );

          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(curved),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
        opaque: false,
        barrierColor: Colors.black54,
        barrierDismissible: true,
      );
    }
  }
}
