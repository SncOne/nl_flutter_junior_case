import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/constants/app_text_styles.dart';
import 'package:jr_case_boilerplate/core/models/user_model.dart';
import 'package:jr_case_boilerplate/core/routes/app_router.gr.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:jr_case_boilerplate/gen/strings.g.dart';

class ProfileCard extends StatelessWidget {
  final String? image;
  final UserData user;
  const ProfileCard({super.key, this.image, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white10, width: 2),
          ),

          child: ClipOval(
            child: SizedBox(
              width: 56,
              height: 56,
              child: CustomCachedNetworkImage(
                imageUrl: image ?? '',
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                onTap: () => context.router.push(
                  FullScreenImageRoute(
                    imageData: jsonEncode({
                      'urls': image != null ? [image] : [],
                      'index': 0,
                    }),
                  ),
                ),
                errorBuilder: (context, error) {
                  return SizedBox(
                    width: 56,
                    height: 56,
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: AppTextStyles.bodyLarge(
                  weight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              Text(
                user.id,
                style: AppTextStyles.bodyNormal(color: AppColors.white60),
              ),
            ],
          ),
        ),
        AppButton(
          onPressed: () {
            context.router.push(UploadPhotoRoute(initialPhotoUrl: image));
          },
          backgroundColor: AppColors.transparent,
          borderColor: AppColors.white10,
          label: context.t.add_photo,
        ),
      ],
    );
  }
}
