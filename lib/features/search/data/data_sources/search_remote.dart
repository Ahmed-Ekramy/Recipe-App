import 'package:dartz/dartz.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/end_ponits.dart';
import 'package:recipe/core/errors/exceptions.dart';
import 'package:recipe/features/search/data/data_sources/search_data_source.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';

class SearchRemote implements SearchDataSource {
  final ApiConsumer apiConsumer;

  SearchRemote({required this.apiConsumer});

  @override
  Future<Either<String, List<AutocompleteResponseModel>>> autocompleteSearch(
    String query,
  ) async {
    try {
      var response = await apiConsumer.get(
        EndPoint.autocomplete,
        queryParameters: {"number": 10, "query": query},
      );
      List<AutocompleteResponseModel> autocompleteResponseModel = (response as List)
          .map((e) => AutocompleteResponseModel.fromJson(e))
          .toList();
      return Right(autocompleteResponseModel);
    } on ServerException catch (e) {
      return Left(e.toString());
    }
  }

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
  }) async {
    try {
      final queryParams = {
        "number": 30,
        "query": query,
        if (includeIngredients != null && includeIngredients.isNotEmpty)
          "includeIngredients": includeIngredients,
        if (minCalories != null) "minCalories": minCalories,
        if (maxCalories != null) "maxCalories": maxCalories,
        if (minProtein != null) "minProtein": minProtein,
        if (maxProtein != null) "maxProtein": maxProtein,
        if (minFat != null) "minFat": minFat,
        if (maxFat != null) "maxFat": maxFat,
        if (minCarbs != null) "minCarbs": minCarbs,
        if (maxCarbs != null) "maxCarbs": maxCarbs,
      };

      var response = await apiConsumer.get(
        EndPoint.complexSearch,
        queryParameters: queryParams,
      );
      ComplexSearchModel complexSearchModel =
          ComplexSearchModel.fromJson(response);
      return Right(complexSearchModel);
    } on ServerException catch (e) {
      return Left(e.toString());
    }
  }
}
