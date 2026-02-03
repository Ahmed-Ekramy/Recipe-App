import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';

class KitchenGearNeeded extends StatelessWidget {
  final List<Equipment> equipmentResponseModel;
  final int index;

  const KitchenGearNeeded(this.equipmentResponseModel, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade50, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
            ),
            child: CachedRecipeImage(
              width: 50,
              height: 80,
              fit: BoxFit.fill,
              imageUrl:
                  "https://spoonacular.com/cdn/equipment_100x100/${equipmentResponseModel[index].image ?? ""}",
            ),
          ),
          const SizedBox(width: 10),
          Text(
            " ${equipmentResponseModel[index].name}",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
