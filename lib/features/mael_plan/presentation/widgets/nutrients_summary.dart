import 'package:flutter/material.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';
import 'package:recipe/features/mael_plan/presentation/widgets/nutrient_item.dart';

class NutrientsSummary extends StatelessWidget {
  final Nutrients nutrients;
  const NutrientsSummary({super.key, required this.nutrients});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bolt, color: Colors.orange, size: 20),
              const SizedBox(width: 8),
              Text(
                "${nutrients.calories?.round()} Calories",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NutrientItem(label: "Protein", value: "${nutrients.protein?.round()}g"),
              NutrientItem(label: "Fat", value: "${nutrients.fat?.round()}g"),
              NutrientItem(label: "Carbs", value: "${nutrients.carbohydrates?.round()}g"),
            ],
          ),
        ],
      ),
    );
  }
}
