import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/dio_consumer.dart';
import 'package:recipe/core/shared_widget/custom_button.dart';
import 'package:recipe/core/shared_widget/custom_text_form_field.dart';
import 'package:recipe/features/mael_plan/data/data_sources/plan_remote.dart';
import 'package:recipe/features/mael_plan/presentation/manager/cubit.dart';
import 'package:recipe/features/mael_plan/presentation/manager/states.dart';

class MealPlanView extends StatelessWidget {
  MealPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanCubit(PlanRemote(DioConsumer(dio: Dio()))),
      child: BlocBuilder<PlanCubit, PlanState>(
        builder: (context, state) {
          final cubit = context.read<PlanCubit>();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Weekly Calorie Goal", style: TextStyle(fontSize: 17)),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    cursorColor:  Colors.orange,
                    controller: cubit.calorieController,
                    textInputAction: TextInputAction.done,
                    hintText: "e.g.2000 ",
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      cubit.calorie = int.tryParse(val);
                    },
                    onFieldSubmitted: (val) {
                      cubit.calorie = int.tryParse(val);
                    },
                    backgroundColor: Colors.orange.shade50,
                    enabledBorderColor: Colors.orange.shade50,
                    focusedBorderColor: Colors.orange.shade50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Diet Type",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: cubit.diets.map((diet) {
                      final isSelected = cubit.selectedDiet == diet;
                      return ChoiceChip(
                        label: Text(diet),
                        selected: isSelected,
                        selectedColor: Colors.orange,
                        backgroundColor: Colors.orange.shade50,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        onSelected: (_) {
                          context.read<PlanCubit>().selectDiet(diet);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Exclude Ingredients",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(cubit.exclude.length, (index) {
                      final isSelected = cubit.selectedIngredients.contains(
                        cubit.exclude[index],
                      );
                      return ChoiceChip(
                        label: Text(cubit.exclude[index]),
                        selected: isSelected,
                        selectedColor: isSelected
                            ? Colors.orange
                            : Colors.orange.shade50,
                        backgroundColor: Colors.orange.shade50,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        onSelected: (_) {
                          cubit.excludeIngredient(cubit.exclude[index]);
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 15),
                  CustomElevButton(
                    colorButton: Colors.orange,
                    onPressed: () {
                      context.read<PlanCubit>().getPlan();
                    },
                    buttonName: "Get Plan",
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
