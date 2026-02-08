import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/mael_plan/data/data_sources/plan_data_source.dart';
import 'package:recipe/features/mael_plan/data/repositories/plan_repo_imp.dart';
import 'package:recipe/features/mael_plan/domain/repositories/plan_repo.dart';
import 'package:recipe/features/mael_plan/domain/use_cases/plan_repo_use_case.dart';
import 'package:recipe/features/mael_plan/presentation/manager/states.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanDataSource planDataSource;
  final List<String> diets = [
    'Gluten Free',
    'Ketogenic',
    'Vegetarian',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Low FODMAP',
    'Whole30',
  ];
  String? diet;
  String? selectedDiet;
  int? index ;
  final Set<String> selectedIngredients = {};
  final List<String> exclude = [
    "Dairy",
    "Egg",
    "Gluten",
    "Grain",
    "Peanut",
    "Seafood",
    "Sesame",
    "Shellfish",
    "Soy",
    "Sulfite",
    "Tree Nut",
    "Wheat",
  ];
  TextEditingController calorieController = TextEditingController();
    int? calorie;
  PlanCubit(this.planDataSource) : super(PlanInitial());
  void getPlan() async {
    emit(PlanLoading());
    PlanRepo planRepo = PlanRepoImp(planDataSource);
    PlanRepoUseCase planRepoUseCase = PlanRepoUseCase(planRepo);
    var result = await planRepoUseCase.getPlan(calorie??0, selectedDiet??"", selectedIngredients);
    result.fold((l) => emit(PlanError(l)), (r) => emit(PlanSuccess(r)));
  }
  void selectDiet(String diet) {
    if (selectedDiet == diet) {
      selectedDiet = null;
      emit(DietInitial());
    } else {
      selectedDiet = diet;
      emit(DietSelected(diet));
    }
  }
  void excludeIngredient(String ingredient) {
    if (selectedIngredients.contains(ingredient)) {
      selectedIngredients.remove(ingredient);
    } else {
      selectedIngredients.add(ingredient);
    }
    emit(IngredientSelected(selectedIngredients));
  }

  @override
  Future<void> close() {
    calorieController.dispose();
    return super.close();
  }
}
