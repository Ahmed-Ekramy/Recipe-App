import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/core/shared_widget/custom_button.dart';
import 'package:recipe/core/shared_widget/custom_text_form_field.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/search/presentation/manager/cubit.dart';
import 'package:recipe/features/search/presentation/manager/states.dart';

class FilterSearchView extends StatelessWidget {
  const FilterSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Filters",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.delete, width: 25, height: 25),
        ),
        actions: [
          GestureDetector(
            onTap: () => cubit.resetFilters(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                "Reset",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search by Ingredients",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Add ingredients to filter",
                    style: TextStyle(fontSize: 15, color: Colors.brown.shade300),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: cubit.ingredientController,
                    cursorColor: Colors.orange,
                    backgroundColor: Colors.orange.shade50,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    hintText: "Search by Ingredients(e.g: tomato, beef)",
                    hintColor: Colors.brown,
                    focusedBorderColor: Colors.orange,
                    enabledBorderColor: Colors.white70,
                    onFieldSubmitted: (value) => cubit.addIngredient(),
                    prefixIcon: SizedBox(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.search,
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Colors.orange,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => cubit.addIngredient(),
                      child: SizedBox(
                        width: 70,
                        height: 50,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cubit.ingredients.isNotEmpty,
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            cubit.ingredients.length,
                            (index) => Chip(
                              label: Text(cubit.ingredients[index]),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () => cubit.removeIngredient(index),
                              backgroundColor: Colors.orange.shade100,
                              labelStyle: const TextStyle(color: Colors.brown),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Search by Nutrients",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Adjust ranges for your dietary goals",
                    style: TextStyle(fontSize: 15, color: Colors.brown.shade300),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Calories(kcal)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    divisions: 10,
                    mouseCursor: WidgetStateMouseCursor.clickable,
                    inactiveColor: Colors.orange.shade100,
                    activeColor: Colors.orange,
                    values: cubit.calories,
                    labels: RangeLabels(cubit.calories.start.round().toString(),
                        cubit.calories.end.round().toString()),
                    onChanged: (RangeValues value) {
                      cubit.updateCalories(value);
                    },
                    min: 0,
                    max: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Protein(g)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    divisions: 10,
                    mouseCursor: WidgetStateMouseCursor.clickable,
                    inactiveColor: Colors.orange.shade100,
                    activeColor: Colors.orange,
                    values: cubit.protein,
                    labels: RangeLabels(cubit.protein.start.round().toString(),
                        cubit.protein.end.round().toString()),
                    onChanged: (RangeValues value) {
                      cubit.updateProtein(value);
                    },
                    min: 0,
                    max: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Fats(g)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    divisions: 10,
                    mouseCursor: WidgetStateMouseCursor.clickable,
                    inactiveColor: Colors.orange.shade100,
                    activeColor: Colors.orange,
                    values: cubit.fat,
                    labels: RangeLabels(cubit.fat.start.round().toString(),
                        cubit.fat.end.round().toString()),
                    onChanged: (RangeValues value) {
                      cubit.updateFat(value);
                    },
                    min: 0,
                    max: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Carbs(g)",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  RangeSlider(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    divisions: 10,
                    mouseCursor: WidgetStateMouseCursor.clickable,
                    inactiveColor: Colors.orange.shade100,
                    activeColor: Colors.orange,
                    values: cubit.carbs,
                    labels: RangeLabels(cubit.carbs.start.round().toString(),
                        cubit.carbs.end.round().toString()),
                    onChanged: (RangeValues value) {
                      cubit.updateCarbs(value);
                    },
                    min: 0,
                    max: 100,
                  ),
                  const SizedBox(height: 20),
                  CustomElevButton(
                    height: 60,
                    onPressed: () {
                      cubit.complexSearch(cubit.searchController.text);
                      Navigator.pushNamed(context, Routes.searchResult,
                          arguments: cubit);
                    },
                    buttonName: "Show Recipes",
                    colorButton: Colors.orange,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

