import 'package:dartz/dartz.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';

abstract class PlanRepo {
  Future<Either<String, PlanModel>> getPlan( int targetCalories, String diet, Set<String> selectedIngredients,);


}