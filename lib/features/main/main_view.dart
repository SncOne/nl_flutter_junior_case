import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/features/nav_bar/view/nav_bar_view.dart';

@RoutePage(name: 'MainRoute')
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: AppColors.bgGradient,
              ),
            ),
            child: AutoTabsScaffold(
              resizeToAvoidBottomInset: true,
              routes: const [HomeRoute(), ProfileRoute()],
              backgroundColor: AppColors.transparent,
              bottomNavigationBuilder: (context, tabsRouter) =>
                  CustomNavBar(tabsRouter: tabsRouter),
            ),
          );
        },
      ),
    );
  }
}
