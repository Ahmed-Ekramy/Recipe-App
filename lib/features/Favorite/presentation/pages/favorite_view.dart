import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/utils/app_images.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';
import 'package:recipe/features/Favorite/presentation/manager/favorite_cubit.dart';
import 'package:recipe/features/Favorite/presentation/manager/states.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoriteSuccess) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: state.favorites.length,
            itemBuilder: (context, index) => FavItem(
              recipe: state.favorites[index],
            ),
          );
        } else if (state is FavoriteError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}

class FavItem extends StatelessWidget {
  final FavoriteModel recipe;
  const FavItem({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(

            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: recipe.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.recipe,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      FavoriteCubit.get(context).removeFavorite(recipe.id);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      child: SvgPicture.asset(
                        AppImages.heartAdd, // You might want to use a filled heart here if available
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          Colors.orange,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              recipe.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),
        ],
      ),
    );
  }
}
