import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/presentation/manager/cubit.dart';
import 'package:recipe/features/details/presentation/manager/states.dart';
import 'package:recipe/features/details/presentation/widgets/instruction_step_tile.dart';

class AnalyzedInstructionsWidget extends StatelessWidget {
  final List<AnalyzedInstruction> instructions;

  const AnalyzedInstructionsWidget({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    if (instructions.isEmpty) return const SizedBox.shrink();

    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        var cubit = DetailsCubit.get(context);
        bool isSectionExpanded = cubit.isInstructionExpanded;

        int totalSteps = 0;
        for (final instruction in instructions) {
          totalSteps += instruction.steps?.length ?? 0;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                cubit.toggleInstructions();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  children: [
                    const Text(
                      "Instructions",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$totalSteps steps",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ),
                    Icon(
                      isSectionExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: Colors.orange,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            if (isSectionExpanded)
              ...instructions.asMap().entries.map((entry) {
                int instIndex = entry.key;
                var instruction = entry.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (instruction.name != null &&
                        instruction.name!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          instruction.name!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: instruction.steps?.length ?? 0,
                      itemBuilder: (context, index) {
                        final step = instruction.steps![index];
                        String stepKey = "${instIndex}_$index";
                        return InstructionStepTile(
                          step: step,
                          stepKey: stepKey,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }),

          ],
        );
      },
    );
  }
}

