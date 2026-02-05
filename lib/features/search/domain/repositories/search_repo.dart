import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';

abstract class SearchRepo {
  Future<Either<String, ComplexSearchModel>> complexSearch(
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
  });
  Future<Either<String, List<AutocompleteResponseModel>>> autocompleteSearch(String query);
}