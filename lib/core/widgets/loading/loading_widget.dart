import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';

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
    final offset = -size / 8;

    final controller = useAnimationController(duration: Durations.extralong4)
      ..repeat();

    final Widget Function(double begin, double end) bottom = useCallback(
      (final begin, final end) => _Dot(
        begin: Offset.zero,
        end: Offset(0, offset),
        interval: Interval(begin, end),
        color: color,
        controller: controller,
        size: size,
      ),
      const [],
    );

    final Widget Function(double begin, double end) top = useCallback(
      (final begin, final end) => _Dot(
        begin: Offset(0, offset),
        end: Offset.zero,
        interval: Interval(begin, end),
        color: color,
        controller: controller,
        size: size,
      ),
      const [],
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (final _, final __) {
        return SizedBox.square(
          dimension: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.value <= 0.50)
                    bottom(0.12, 0.50)
                  else
                    top(0.62, 1),
                  if (controller.value <= 0.44)
                    bottom(0.06, 0.44)
                  else
                    top(0.56, 0.94),
                  if (controller.value <= 0.38)
                    bottom(0, 0.38)
                  else
                    top(0.50, 0.88),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    required this.begin,
    required this.end,
    required this.interval,
    required this.color,
    required this.size,
    required this.controller,
  });
  final Offset begin;
  final Offset end;
  final Interval interval;
  final double size;
  final Animation<double> controller;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    return RepaintBoundary(
      child: Transform.translate(
        offset: Tween(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(parent: controller, curve: interval)).value,
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: SizedBox.square(dimension: size / 5),
        ),
      ),
    );
  }
}
