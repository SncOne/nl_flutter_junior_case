import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/shine_overlay/shine_overlay.dart';
import 'package:jr_case_boilerplate/features/offer/widgets/bonus_item_card.dart';
import 'package:jr_case_boilerplate/features/offer/widgets/package_card.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

@RoutePage(name: 'OfferBottomSheetRoute')
class OfferBottomSheet extends HookWidget {
  const OfferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;
    final screenWidth = media.size.width;

    final availableHeight =
        screenHeight - media.padding.top - media.viewInsets.bottom - 24;

    final maxSheetHeight = availableHeight.clamp(0.0, screenHeight);

    final minSheetHeight = math.min(430.0, maxSheetHeight);

    final defaultOpen = (maxSheetHeight * 0.75).clamp(
      minSheetHeight,
      maxSheetHeight,
    );
    final sheetHeight = useState<double>(defaultOpen);

    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedPadding(
          padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
          duration: const Duration(milliseconds: 150),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxSheetHeight,
              minHeight: minSheetHeight,
              maxWidth: screenWidth,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutCubic,
              height: sheetHeight.value,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.bgGradient,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(blurRadius: 12, color: Colors.black26),
                ],
              ),
              child: SafeArea(
                top: false,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Positioned(
                          top: -30,
                          left: 0,
                          right: 0,
                          child: IgnorePointer(child: ShineOverlay()),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 48,
                              child: Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    child: Center(
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onVerticalDragUpdate: (details) {
                                          final newH =
                                              (sheetHeight.value -
                                                      details.delta.dy)
                                                  .clamp(
                                                    minSheetHeight,
                                                    maxSheetHeight,
                                                  )
                                                  .toDouble();
                                          sheetHeight.value = newH;
                                        },
                                        onVerticalDragEnd: (details) {
                                          final velocity = details
                                              .velocity
                                              .pixelsPerSecond
                                              .dy;
                                          final anchors = [
                                            minSheetHeight,
                                            defaultOpen,
                                            maxSheetHeight,
                                          ];
                                          double target = defaultOpen;
                                          if (velocity.abs() > 400) {
                                            target = velocity < 0
                                                ? maxSheetHeight
                                                : minSheetHeight;
                                          } else {
                                            target = anchors.reduce((a, b) {
                                              return ((sheetHeight.value - a)
                                                          .abs() <
                                                      (sheetHeight.value - b)
                                                          .abs())
                                                  ? a
                                                  : b;
                                            });
                                          }
                                          sheetHeight.value = target;
                                        },
                                        child: SizedBox(
                                          height: 36,
                                          child: Center(
                                            child: Container(
                                              width: 44,
                                              height: 6,
                                              margin: const EdgeInsets.only(
                                                bottom: 8,
                                                top: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.white20,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () => context.router.pop(),
                                      icon: const Icon(
                                        Icons.close,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: Column(
                                  spacing: 24,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Column(
                                          spacing: 24,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 8,
                                                  ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    context.t.limited_offer,
                                                    style: AppTextStyles.h4(
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    context
                                                        .t
                                                        .limited_offer_subtitle,
                                                    style:
                                                        AppTextStyles.bodyNormal(
                                                          color:
                                                              AppColors.white70,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            BonusItemCard(),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Row(
                                      spacing: 12,
                                      children: [
                                        Expanded(
                                          child: PackageCard(
                                            isFeatured: false,
                                            discountLabel: '+10%',
                                            price: '₺99,99',
                                            tokens: '300',
                                            oldTokens: '200',
                                          ),
                                        ),
                                        Expanded(
                                          child: PackageCard(
                                            isFeatured: true,
                                            discountLabel: '+70%',
                                            price: '₺799,99',
                                            tokens: '3.375',
                                            oldTokens: '2.000',
                                          ),
                                        ),
                                        Expanded(
                                          child: PackageCard(
                                            isFeatured: false,
                                            discountLabel: '+35%',
                                            price: '₺399,99',
                                            tokens: '1.350',
                                            oldTokens: '1.000',
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      width: double.infinity,
                                      child: AppButton(
                                        onPressed: () {},
                                        backgroundColor: AppColors.primary,
                                        label: context.t.see_all_token_plans,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
