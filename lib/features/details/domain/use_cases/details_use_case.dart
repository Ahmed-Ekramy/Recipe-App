import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';

class DetailsUseCase {
  DetailsRepo detailsRepo;
  DetailsUseCase(this.detailsRepo);
 Future<Either<String, DetailsResponseModel>> call(int id)=> detailsRepo.getDetails(id);
}