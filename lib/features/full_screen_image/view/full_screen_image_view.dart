import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';

@RoutePage(name: 'FullScreenImageRoute')
class FullScreenImageView extends HookWidget {
  const FullScreenImageView({
    @PathParam('imageData') required this.imageData,
    super.key,
  });

  final String imageData;

  @override
  Widget build(final BuildContext context) {
    final transformationController = useTransformationController();
    final doubleTapDetails = useState<TapDownDetails?>(null);
    final pointers = useState([]);
    final isZoomedIn = useState(false);

    void handleDoubleTapDown(final TapDownDetails details) {
      doubleTapDetails.value = details;
    }

    void handleDoubleTap() {
      if (transformationController.value != Matrix4.identity()) {
        transformationController.value = Matrix4.identity();
      } else {
        final position = doubleTapDetails.value!.localPosition;
        transformationController.value = Matrix4.identity()
          ..translateByDouble(-position.dx * 2, -position.dy * 2, 1, 1)
          ..scaleByDouble(3.5, 3.5, 1, 1);
      }
    }

    void onScaleChanged(final double scale) {
      if (scale > 1.0) {
        isZoomedIn.value = true;
      } else {
        isZoomedIn.value = false;
      }
    }

    void onPointerDown(final PointerDownEvent details) {
      pointers.value.add(details);
      if (pointers.value.length == 2) {
        isZoomedIn.value = true;
      }
    }

    void onPointerUp(final PointerUpEvent details) {
      pointers.value.removeLast();
      if (pointers.value.length < 2) {
        isZoomedIn.value = false;
      }
    }

    void onInteractionEnd(final details) {
      final scale = transformationController.value.getMaxScaleOnAxis();
      onScaleChanged(scale);
    }

    final isJsonData = imageData.trim().startsWith('{');
    List<String> urls;
    int index;
    if (isJsonData) {
      final decoded = jsonDecode(imageData);
      urls = List<String>.from(decoded['urls'] as Iterable<dynamic>);
      index = decoded['index'] as int;
    } else {
      urls = [imageData.trim()];
      index = 0;
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          onPressed: () async => context.router.maybePop(),
        ),
      ),
      body: PopScope(
        onPopInvokedWithResult: (final didPop, final result) async {
          if (!didPop) context.router.maybePop();
        },
        child: Listener(
          onPointerDown: onPointerDown,
          onPointerUp: onPointerUp,
          child: PageView.builder(
            itemCount: urls.length,
            controller: PageController(initialPage: index),
            physics: isZoomedIn.value
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            itemBuilder: (final context, final index) {
              final imageUrl = urls[index];
              final isAsset = imageUrl.startsWith('assets/');
              return Center(
                child: Hero(
                  tag: 'image_$index',
                  child: GestureDetector(
                    onDoubleTapDown: handleDoubleTapDown,
                    onDoubleTap: handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: transformationController,
                      onInteractionEnd: onInteractionEnd,
                      minScale: 0.5,
                      maxScale: 5,
                      child: isAsset
                          ? Image.asset(imageUrl, fit: BoxFit.contain)
                          : CustomCachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error) {
                                return Container(
                                  width: double.infinity,
                                  color: AppColors.black,
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: AppColors.white50,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
