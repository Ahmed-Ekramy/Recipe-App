import 'package:dartz/dartz.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/end_ponits.dart';
import 'package:recipe/core/errors/exceptions.dart';
import 'package:recipe/features/home/data/data_sources/home_data_source.dart';
import 'package:recipe/features/home/data/models/random_model.dart';

class HomeRemote implements HomeDataSource {
  final ApiConsumer api;

  HomeRemote({required this.api});

  @override
  Future<Either<String, List<Recipe>>> getRecipes(String type, int num) async {
    try {
      final response = await api.get(
        EndPoint.recipes,
        queryParameters: {"number": num, "include-tags": type},
      );
      print("hhhhhhhhhhhhhhhhhhhhhhhh${response.runtimeType}");
       final randomResponse =
       RandomResponseModel.fromJson(response);
       return Right(randomResponse.recipes ?? []);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
