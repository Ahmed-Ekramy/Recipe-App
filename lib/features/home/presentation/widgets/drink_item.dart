import 'package:flutter/material.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';

class DrinkItem extends StatelessWidget {
  final List<dynamic> drinkList;
  final int index;

  const DrinkItem(this.drinkList, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.orange.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.orange.shade100),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedRecipeImage(
                height: 100,
                width: 100,
                imageUrl: "${drinkList[index].image}",
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Juice",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    maxLines:  1,
                    overflow: TextOverflow.ellipsis,
                    "${drinkList[index].title}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${drinkList[index].readyInMinutes} mins",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.shade100,
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
