import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';

class SimilarUseCase {
  DetailsRepo detailsRepo;
  SimilarUseCase(this.detailsRepo);
  Future<Either<String, List<SimilarResponseModel>>> call(int id)=> detailsRepo.getSimilar(id);
}