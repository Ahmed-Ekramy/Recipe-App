import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';
import 'package:recipe/features/Favorite/presentation/manager/favorite_cubit.dart';
import 'package:recipe/features/Favorite/presentation/manager/states.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';

class PopularBreakfastItem extends StatelessWidget {
  final List<dynamic> randomEntity;
  final int index;

  const PopularBreakfastItem(this.randomEntity, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          'recipeDetails',
          arguments: {'id': randomEntity[index].id},
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: CachedRecipeImage(
              height: double.infinity,
              width: 220,
              imageUrl: "${randomEntity[index].image}",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                var isFav= FavoriteCubit.get(context).isFavorite(randomEntity[index].id);

                return InkWell(
                  onTap: () {
                    FavoriteCubit.get(context).toggleFavorite(
                      FavoriteModel(
                        id: randomEntity[index].id,
                        title: "${randomEntity[index].title}",
                        image: randomEntity[index].image,
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    AppImages.heartAdd,
                    fit: BoxFit.contain,
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                        isFav ? Colors.orange : Colors.white, BlendMode.srcIn),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black38,
              ),
              child: Text(
                "${randomEntity[index].readyInMinutes} mins",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            right: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black38,
                ),
                child: Text(
                  "${randomEntity[index].title}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
