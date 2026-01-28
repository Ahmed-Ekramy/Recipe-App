import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/shared_widget/custom_button.dart';
import 'package:recipe/core/shared_widget/custom_text_form_field.dart';
import 'package:recipe/core/utils/app_images.dart';

class FilterSearchView extends StatefulWidget {
  const FilterSearchView({super.key});

  @override
  State<FilterSearchView> createState() => _FilterSearchViewState();
}

class _FilterSearchViewState extends State<FilterSearchView> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isNotEmpty) {
      setState(() {
        _ingredients.add(ingredient);
        _ingredientController.clear();
      });
    }
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Filters",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.delete, width: 25, height: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Reset",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search by Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add ingredients to filter",
                style: TextStyle(fontSize: 15, color: Colors.brown.shade300),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: _ingredientController,
                cursorColor: Colors.orange,
                backgroundColor: Colors.orange.shade50,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                hintText: "Search by Ingredients(e.g: tomato, beef)",
                hintColor: Colors.brown,
                focusedBorderColor: Colors.orange,
                enabledBorderColor: Colors.white70,
                onFieldSubmitted: (value) => _addIngredient(),
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
                  onTap: _addIngredient,
                  child: SizedBox(
                    width: 70,
                    height: 50,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
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
                visible: _ingredients.isNotEmpty,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        _ingredients.length,
                        (index) => Chip(
                          label: Text(_ingredients[index]),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () => _removeIngredient(index),
                          backgroundColor: Colors.orange.shade100,
                          labelStyle: const TextStyle(color: Colors.brown),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Search by Nutrients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Adjust ranges for your dietary goals",
                style: TextStyle(fontSize: 15, color: Colors.brown.shade300),
              ),
              SizedBox(height: 20),
              Text(
                "Calories(kcal)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                divisions: 10,
                mouseCursor: WidgetStateMouseCursor.clickable,
                inactiveColor: Colors.orange.shade100,
                activeColor: Colors.orange,
                values: RangeValues(0.1, 0.5),
                labels: RangeLabels("0", "100"),
                onChanged: (RangeValues value) {},
              ),
              SizedBox(height: 20),
              Text(
                "Protein(g)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              RangeSlider(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                divisions: 10,
                mouseCursor: WidgetStateMouseCursor.clickable,
                inactiveColor: Colors.orange.shade100,
                activeColor: Colors.orange,
                values: RangeValues(0.1, 0.5),
                labels: RangeLabels("0", "100"),
                onChanged: (RangeValues value) {},
              ),
              SizedBox(height: 20),
              Text(
                "Fats(g)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

              RangeSlider(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                divisions: 10,
                mouseCursor: WidgetStateMouseCursor.clickable,
                inactiveColor: Colors.orange.shade100,
                activeColor: Colors.orange,
                values: RangeValues(0.1, 0.5),
                labels: RangeLabels("0", "100"),
                onChanged: (RangeValues value) {},
              ),
              SizedBox(height: 20),
              Text(
                "Carbs(g)",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                divisions: 10,
                mouseCursor: WidgetStateMouseCursor.clickable,
                inactiveColor: Colors.orange.shade100,
                activeColor: Colors.orange,
                values: RangeValues(0.1, 0.5),
                labels: RangeLabels("0", "100"),
                onChanged: (RangeValues value) {},
              ),
              SizedBox(height: 20),
              CustomElevButton(
                height: 60,
                onPressed: () {},
                buttonName: "Show Recipes",
                colorButton: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
