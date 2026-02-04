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
  Future<Either<String, ComplexSearchModel>> complexSearch(String query)async {
    try {
      var response = await apiConsumer.get(
        EndPoint.complexSearch,
        queryParameters: {"number": 30, "query": query},
      );
      ComplexSearchModel complexSearchModel = ComplexSearchModel.fromJson(response);
      return Right(complexSearchModel);
    } on ServerException catch (e) {
      return Left(e.toString());
    }
  }
}
