import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';

class ViewAll extends StatelessWidget {
  final List<RandomEntity> args;
  const ViewAll({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 5,
        ),
        itemCount: args.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'recipeDetails', arguments: {
                "id": args[index].id,
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Expanded(
                   child: Stack(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: CachedRecipeImage(
                           imageUrl: "${args[index].image}",
                           height: double.infinity,
                           width: 500,
                           fit: BoxFit.fill,
                         ),
                       ),
                       Positioned(
                         top: 5,
                         right: 5,
                         child: Container(
                           alignment: Alignment.center,
                           width: 35,
                           height: 35,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Colors.white70,
                           ),
                           child: SvgPicture.asset(
                             AppImages.heartAdd,
                             fit: BoxFit.contain,
                             width: 30,
                             height: 30,
                             colorFilter: ColorFilter.mode(
                               Colors.orange,
                               BlendMode.srcIn,
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                SizedBox(height: 4),
                Text(
                  "${args[index].title}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.time,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.orange,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      "${args[index].readyInMinutes} mins",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
