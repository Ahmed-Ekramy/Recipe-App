import 'package:flutter/material.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';
import 'package:recipe/features/mael_plan/presentation/widgets/meal_tile.dart';
import 'package:recipe/features/mael_plan/presentation/widgets/nutrients_summary.dart';

class DayMealsContent extends StatelessWidget {
  final Day day;
  const DayMealsContent({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (day.nutrients != null) ...[
          NutrientsSummary(nutrients: day.nutrients!),
          const SizedBox(height: 16),
        ],
        ...?day.meals?.map((meal) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'recipeDetails', arguments: {
                'id': meal.id,
              });
            },
            child: MealTile(meal: meal))),
      ],
    );
  }
}
