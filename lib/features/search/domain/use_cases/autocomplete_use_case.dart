 import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/domain/repositories/search_repo.dart';

class AutocompleteUseCase {
    SearchRepo searchRepo;

    AutocompleteUseCase(this.searchRepo);

    Future<Either<String, List<AutocompleteResponseModel>>> call(String query) => searchRepo.autocompleteSearch(query);
}