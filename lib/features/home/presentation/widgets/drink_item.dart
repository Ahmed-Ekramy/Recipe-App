import 'package:flutter/material.dart';
import 'package:recipe/core/utils/app_images.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Colors.white,
      elevation: 3,
      shadowColor:  Colors.orange.shade100,
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
              child: Image.asset(
                AppImages.recipe,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Column(
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
                  "Fried Potatoes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "5 mins | 120 kcal",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
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