import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/presentation/manager/cubit.dart';
import 'package:recipe/features/details/presentation/manager/states.dart';

class InstructionStepTile extends StatelessWidget {
  final InstructionStep step;
  final String stepKey;

  const InstructionStepTile(
      {super.key, required this.step, required this.stepKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        var cubit = DetailsCubit.get(context);
        bool isExpanded = cubit.expandedStepKeys.contains(stepKey);
        bool hasDetails =
            (step.ingredients?.isNotEmpty ?? false) || (step.equipment?.isNotEmpty ?? false);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: isExpanded,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onExpansionChanged: (expanded) {
                cubit.toggleStep(stepKey);
              },
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isExpanded ? Colors.orange : Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "${step.number}",
                  style: TextStyle(
                    color: isExpanded ? Colors.white : Colors.orange.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              title: Text(
                step.step ?? "",
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded ? null : TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isExpanded ? FontWeight.w600 : FontWeight.normal,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
              children: [
                if (hasDetails)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: 24),
                        if (step.ingredients?.isNotEmpty ?? false) ...[
                          const Text(
                            "Ingredients in this step:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 70.0,
                            child: ListView.separated(
                              key: ValueKey("ingredients_list_$stepKey"),
                              scrollDirection: Axis.horizontal,
                              itemCount: step.ingredients!.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 12.0),

                              itemBuilder: (context, i) {
                                final ingredient = step.ingredients![i];
                                return SizedBox(
                                  width: 60.0,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedRecipeImage(
                                          imageUrl:
                                              "https://spoonacular.com/cdn/ingredients_100x100/${ingredient.image}",
                                          height: 40.0,
                                          width: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        ingredient.name ?? "",
                                        style: const TextStyle(fontSize: 10.0),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                        ],
                        if (step.equipment?.isNotEmpty ?? false) ...[
                          const SizedBox(height: 12),
                          const Text(
                            "Equipment:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: step.equipment!.map((e) {
                              return Chip(
                                padding: EdgeInsets.zero,
                                labelPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                backgroundColor: Colors.blue.shade50,
                                side: BorderSide.none,
                                label: Text(
                                  e.name ?? "",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                        if (step.length != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.timer_outlined,
                                  size: 16.0, color: Colors.orange.shade400),
                              const SizedBox(width: 4),
                              Text(
                                "Duration: ${step.length!.number} ${step.length!.unit}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}