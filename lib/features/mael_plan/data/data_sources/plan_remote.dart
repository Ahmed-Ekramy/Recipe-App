import 'package:dartz/dartz.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/end_ponits.dart';
import 'package:recipe/core/errors/exceptions.dart';
import 'package:recipe/features/mael_plan/data/data_sources/plan_data_source.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';

class PlanRemote implements PlanDataSource {
  ApiConsumer api;

  PlanRemote(this.api);

  @override
  Future<Either<String, PlanModel>> getPlan(
    int targetCalories,
    String diet,
    Set<String> selectedIngredients,
  ) async {
    try {
      final response = await api.get(
        EndPoint.mealPlan,
        queryParameters: {
          "timeFrame": "week",
          "targetCalories": targetCalories,
          "diet": diet,
          "exclude": selectedIngredients.join(","),
        },
      );
      final planResponse = PlanModel.fromJson(response);
      return Right(planResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
