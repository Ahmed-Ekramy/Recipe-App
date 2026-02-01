import 'package:dartz/dartz.dart';
import 'package:recipe/features/home/data/data_sources/home_data_source.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';
import 'package:recipe/features/home/domain/repositories/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  HomeDataSource homeDataSource;

  HomeRepoImp({required this.homeDataSource});

  @override
  Future<Either<String, List<RandomEntity>>> getRecipes(String type, int num) =>
      homeDataSource.getRecipes(type, num);
}
