import 'package:dartz/dartz.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/end_ponits.dart';
import 'package:recipe/core/errors/exceptions.dart';
import 'package:recipe/features/details/data/data_sources/details_data_source.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';

class DetailsRemote implements DetailsDataSource {
  ApiConsumer apiConsumer;

  DetailsRemote(this.apiConsumer);

  @override
  Future<Either<String, DetailsResponseModel>> getDetails(int id) async {
    try {
      var response = await apiConsumer.get(EndPoint.recipesDetails(id));
      DetailsResponseModel detailsResponseModel = DetailsResponseModel.fromJson(
        response,
      );
      return (Right(detailsResponseModel));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, EquipmentResponseModel>> getEquipment(int id) async {
    try {
      var response = await apiConsumer.get(EndPoint.recipesEquipment(id));
      EquipmentResponseModel equipmentResponseModel =
          EquipmentResponseModel.fromJson(response);
      return (Right(equipmentResponseModel));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, NutritionResponseModel>> getNutrition(int id) async {
    try {
      var response = await apiConsumer.get(EndPoint.recipesNutrition(id));
      NutritionResponseModel nutritionResponseModel =
          NutritionResponseModel.fromJson(response);
      return (Right(nutritionResponseModel));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  @override
  Future<Either<String, List<SimilarResponseModel>>> getSimilar(int id) async {
    try {
      var response = await apiConsumer.get(EndPoint.recipesSimilar(id),queryParameters : {
        "number": 50,
      });
      List<SimilarResponseModel> similarRecipes =
          List<SimilarResponseModel>.from(
        response.map((e) => SimilarResponseModel.fromJson(e)),
      );
      return (Right(similarRecipes));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
