import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';
import 'package:jr_case_boilerplate/core/enums/assets/app_icons.dart';
import 'package:jr_case_boilerplate/core/models/movie_list_model.dart';
import 'package:jr_case_boilerplate/core/widgets/buttons/custom_primary_button.dart';
import 'package:jr_case_boilerplate/core/widgets/overlay/custom_overlay.dart';
import 'package:jr_case_boilerplate/features/home/provider/movie_provider.dart';

class FavoriteButton extends HookConsumerWidget {
  final MovieModel movie;

  const FavoriteButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerIsFav = ref.watch(
      movieListProvider.select(
        (state) => state.items
            .firstWhere((m) => m.id == movie.id, orElse: () => movie)
            .isFavorite,
      ),
    );

    final isFav = useState<bool>(movie.isFavorite);
    final isLoading = useState<bool>(false);

    useEffect(() {
      if (providerIsFav != isFav.value) {
        isFav.value = providerIsFav;
      }
      return null;
    }, [providerIsFav, movie.id]);

    return AppButton(
      onPressed: () async {
        if (isLoading.value) return;

        isFav.value = !isFav.value;
        isLoading.value = true;

        try {
          await ref
              .read(favoriteMovieNotifierProvider.notifier)
              .toggleFavorite(movie.id);
        } catch (e) {
          isFav.value = !isFav.value;
          if (context.mounted) {
            CustomOverlay.show(
              context,
              message: 'Favori güncellenemedi : ${e.toString()}',
              type: OverlayType.error,
            );
          }
        } finally {
          isLoading.value = false;
        }
      },
      backgroundColor: AppColors.transparent,
      borderColor: AppColors.white60,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 24),
      borderRadius: 50,
      iconSize: 24,
      rightIcon: isFav.value ? AppIcons.heartFill : AppIcons.heart,
      iconColor: isFav.value ? AppColors.primary : AppColors.white,
    );
  }
}
