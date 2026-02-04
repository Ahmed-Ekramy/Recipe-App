import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';

class NutritionUseCase {
  DetailsRepo detailsRepo;
  NutritionUseCase(this.detailsRepo);
  Future<Either<String, NutritionResponseModel>> call(int id)=> detailsRepo.getNutrition(id);
}