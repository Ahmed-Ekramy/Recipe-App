import 'package:flutter/material.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';

class SimilarItem extends StatelessWidget {
  final List<SimilarResponseModel>? similarResponseModel;
  final int index;
  const SimilarItem( this.similarResponseModel, this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.recipeDetails, arguments: {
          'id': similarResponseModel?[index].id,
        });
      },
      child: SizedBox(
        width:  250,
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize:  MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:  CachedRecipeImage(
                        imageUrl: similarResponseModel?[index].image ?? "",
                        height: 150,
                        fit: BoxFit.cover,
      
                      )
                    ),
      
                SizedBox(height: 5),
                Text(
                  similarResponseModel?[index].title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${ similarResponseModel?[index].readyInMinutes} mins",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}