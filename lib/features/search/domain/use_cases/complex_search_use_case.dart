import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';
import 'package:recipe/features/search/domain/repositories/search_repo.dart';

class ComplexSearchUseCase {
  SearchRepo searchRepo;

  ComplexSearchUseCase(this.searchRepo);

  Future<Either<String, ComplexSearchModel>> call(
    String query, {
    String? includeIngredients,
    num? minCalories,
    num? maxCalories,
    num? minProtein,
    num? maxProtein,
    num? minFat,
    num? maxFat,
    num? minCarbs,
    num? maxCarbs,
  }) =>
      searchRepo.complexSearch(
        query,
        includeIngredients: includeIngredients,
        minCalories: minCalories,
        maxCalories: maxCalories,
        minProtein: minProtein,
        maxProtein: maxProtein,
        minFat: minFat,
        maxFat: maxFat,
        minCarbs: minCarbs,
        maxCarbs: maxCarbs,
      );
}
