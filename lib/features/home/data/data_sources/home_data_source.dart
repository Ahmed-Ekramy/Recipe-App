import 'package:dartz/dartz.dart';
import 'package:recipe/features/home/data/models/random_model.dart';

abstract class HomeDataSource {
  Future<Either<String, List<Recipe>>> getRecipes(String type,int num);
}