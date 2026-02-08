import 'package:dartz/dartz.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';

abstract class PlanDataSource {
  Future<Either<String, PlanModel>> getPlan( int targetCalories, String diet, Set<String> selectedIngredients,);

}

