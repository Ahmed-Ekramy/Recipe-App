import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';

abstract class DetailsRepo {
  Future<Either<String, DetailsResponseModel>> getDetails(int id);
  Future<Either<String, EquipmentResponseModel>> getEquipment(int id);
  Future<Either<String, NutritionResponseModel>> getNutrition(int id);
  Future<Either<String, List<SimilarResponseModel>>> getSimilar(int id);


}