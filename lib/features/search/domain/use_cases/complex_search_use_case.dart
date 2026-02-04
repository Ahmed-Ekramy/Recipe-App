import 'package:dartz/dartz.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';
import 'package:recipe/features/search/domain/repositories/search_repo.dart';

class ComplexSearchUseCase {
  SearchRepo searchRepo;

  ComplexSearchUseCase(this.searchRepo);

  Future<Either<String, ComplexSearchModel>> call(String query) =>
      searchRepo.complexSearch(query);
}
