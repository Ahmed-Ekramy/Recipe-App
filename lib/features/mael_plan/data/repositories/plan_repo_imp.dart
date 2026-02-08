import 'package:dartz/dartz.dart';
import 'package:recipe/features/mael_plan/data/data_sources/plan_data_source.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';
import 'package:recipe/features/mael_plan/domain/repositories/plan_repo.dart';

class PlanRepoImp implements PlanRepo {
  PlanDataSource planDataSource;

  PlanRepoImp(this.planDataSource);

  @override
  Future<Either<String, PlanModel>> getPlan(int targetCalories, String diet, Set<String> selectedIngredients,) =>
      planDataSource.getPlan(targetCalories, diet, selectedIngredients);
}
