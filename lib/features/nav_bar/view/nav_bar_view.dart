import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/helpers/print.dart';
import 'package:jr_case_boilerplate/features/nav_bar/widgets/custom_nav_bar_item.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class CustomNavBar extends HookWidget {
  final TabsRouter? tabsRouter;

  const CustomNavBar({super.key, this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    final router = tabsRouter ?? AutoTabsRouter.of(context);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        animationController.forward();
      });
      return null;
    }, []);

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final bottomPadding = MediaQuery.of(context).padding.bottom;

        final slideValue = Curves.easeOutQuart.transform(
          animationController.value,
        );
        final scaleValue = Curves.easeOutBack.transform(
          animationController.value,
        );
        final fadeValue = Curves.easeOut.transform(animationController.value);

        return Transform.translate(
          offset: Offset(0, 15 * (1 - slideValue)),
          child: Opacity(
            opacity: 0.3 + (0.7 * fadeValue),
            child: Transform.scale(
              scale: 0.95 + (0.05 * scaleValue),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20 + bottomPadding,
                ),
                color: AppColors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(
                          -20 * (1 - animationController.value),
                          0,
                        ),
                        child: NavBarItem(
                          icon: AppIcons.home,
                          filledIcon: AppIcons.homeFill,
                          label: context.t.home,
                          isSelected: router.activeIndex == 0,
                          onTap: () {
                            Print.info(
                              'Home tapped - current index: ${router.activeIndex}',
                            );
                            router.setActiveIndex(0);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(20 * (1 - animationController.value), 0),
                        child: NavBarItem(
                          icon: AppIcons.profile,
                          filledIcon: AppIcons.profileFill,
                          label: context.t.profile,
                          isSelected: router.activeIndex == 1,
                          onTap: () {
                            Print.info(
                              'Profile tapped - current index: ${router.activeIndex}',
                            );
                            router.setActiveIndex(1);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
