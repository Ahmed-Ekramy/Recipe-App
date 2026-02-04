import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/data_sources/details_data_source.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';

class DetailsRepoImp implements DetailsRepo {
  DetailsDataSource detailsDataSource;

  DetailsRepoImp(this.detailsDataSource);

  @override
  Future<Either<String, DetailsResponseModel>> getDetails(int id) =>
      detailsDataSource.getDetails(id);

  @override
  Future<Either<String, EquipmentResponseModel>> getEquipment(int id) =>
      detailsDataSource.getEquipment(id);

  @override
  Future<Either<String, NutritionResponseModel>> getNutrition(int id) =>
      detailsDataSource.getNutrition(id);

  @override
  Future<Either<String, List<SimilarResponseModel>>> getSimilar(int id) =>
      detailsDataSource.getSimilar(id);
}
