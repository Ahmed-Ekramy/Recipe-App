import 'package:flutter/material.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "${meal.image}",
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.fastfood, size: 60),
          ),
        ),
        title: Text(
          meal.title ?? "No Title",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text("${meal.readyInMinutes} mins"),
                const SizedBox(width: 12),
                const Icon(Icons.person_outline, size: 16, color: Colors.orange),
                const SizedBox(width: 4),
                Text("${meal.servings} servings"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
