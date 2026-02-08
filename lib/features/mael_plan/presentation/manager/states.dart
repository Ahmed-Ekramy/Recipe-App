import 'package:recipe/features/mael_plan/data/models/plan_model.dart';

class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoading extends PlanState {}

class PlanSuccess extends PlanState {
  final PlanModel planModel;

  PlanSuccess(this.planModel);
}

class PlanError extends PlanState {
  final String errMessage;

  PlanError(this.errMessage);
}
class DietSelected extends PlanState {
  final String diet;
  DietSelected(this.diet);
}
class IngredientSelected extends PlanState {
  final Set<String> selectedIngredients;
  IngredientSelected(this.selectedIngredients);
}
class DietInitial extends PlanState {}
class IngredientsInitial extends PlanState {}

