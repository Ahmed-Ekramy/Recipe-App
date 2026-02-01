import 'package:dartz/dartz.dart';
import 'package:recipe/core/errors/error_model.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';
import 'package:recipe/features/home/domain/repositories/home_repo.dart';

class RandomUseCase {
  HomeRepo homeRepo;

  RandomUseCase(this.homeRepo);

  Future<Either<String, List<RandomEntity>>> call(String type, int num) =>
      homeRepo.getRecipes(type, num);
}
