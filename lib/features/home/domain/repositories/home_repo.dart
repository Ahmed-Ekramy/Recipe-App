import 'package:dartz/dartz.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';

abstract class HomeRepo {
 Future<Either<String, List<RandomEntity>>> getRecipes(String type,int num);
}