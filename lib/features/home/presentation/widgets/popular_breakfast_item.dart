import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';

class PopularBreakfastItem extends StatelessWidget {
 final  List<dynamic> randomEntity;
  final int index;
  const PopularBreakfastItem( this.randomEntity,this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: CachedRecipeImage(
            height:  double.infinity ,
            width: 200,
            imageUrl: "${randomEntity[index].image}",
            fit: BoxFit.cover,
          )
        ),
        Positioned(
          top: 10,
          right: 10,
          child: SvgPicture.asset(
            AppImages.heartAdd,
            fit: BoxFit.contain,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
    );
  }
}
