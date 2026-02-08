import 'package:dartz/dartz.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';
import 'package:recipe/features/mael_plan/domain/repositories/plan_repo.dart';

class PlanRepoUseCase {
  PlanRepo planRepo;

  PlanRepoUseCase(this.planRepo);

  Future<Either<String, PlanModel>> getPlan(int targetCalories, String diet, Set<String> selectedIngredients,) =>
      planRepo.getPlan(targetCalories, diet, selectedIngredients);
}
