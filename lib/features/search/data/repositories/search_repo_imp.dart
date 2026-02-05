import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/data_sources/search_data_source.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';
import 'package:recipe/features/search/domain/repositories/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImp({required this.searchDataSource});
  @override
  Future<Either<String, List<AutocompleteResponseModel>>> autocompleteSearch(String query) => searchDataSource.autocompleteSearch(query);


  @override
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
  }) =>
      searchDataSource.complexSearch(
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