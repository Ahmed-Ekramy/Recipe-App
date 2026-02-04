import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';

abstract class SearchRepo {
  Future<Either<String, ComplexSearchModel>> complexSearch(String query);
  Future<Either<String, List<AutocompleteResponseModel>>> autocompleteSearch(String query);
}