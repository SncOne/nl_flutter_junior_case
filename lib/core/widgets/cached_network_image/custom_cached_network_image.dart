import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget Function(BuildContext, Object) errorBuilder;
  final VoidCallback? onTap;
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    required this.errorBuilder,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        errorWidget: (final context, final url, final error) {
          if (error is HttpException && error.message.contains('404')) {
            debugPrint('Suppressed 404 error for image: $url');
          }
          return errorBuilder(context, error);
        },
      ),
    );
  }
}
