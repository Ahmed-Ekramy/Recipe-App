 import 'package:dartz/dartz.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';

class EquipmentUseCase {
   DetailsRepo detailsRepo;
    EquipmentUseCase(this.detailsRepo);
   Future<Either<String, EquipmentResponseModel>> call(int id)=> detailsRepo.getEquipment(id);
}