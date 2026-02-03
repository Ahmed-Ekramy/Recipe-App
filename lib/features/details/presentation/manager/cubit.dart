import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/details/data/data_sources/details_data_source.dart';
import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';
import 'package:recipe/features/details/data/repositories/details_repo_imp.dart';
import 'package:recipe/features/details/domain/repositories/details_repo.dart';
import 'package:recipe/features/details/domain/use_cases/details_use_case.dart';
import 'package:recipe/features/details/domain/use_cases/equipment_use_case.dart';
import 'package:recipe/features/details/domain/use_cases/nutrition_use_case.dart';
import 'package:recipe/features/details/domain/use_cases/similar_use_case.dart';
import 'package:recipe/features/details/presentation/manager/states.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsDataSource detailsDataSource;
  DetailsResponseModel? detailsResponseModel;
  EquipmentResponseModel? equipmentResponseModel;
  NutritionResponseModel? nutritionResponseModel;
  List<SimilarResponseModel>? similarResponseModel;
  bool isInstructionExpanded = false;
  Set<String> expandedStepKeys = {};
  DetailsCubit(this.detailsDataSource) : super(DetailsInitialState());
  static DetailsCubit get(context) => BlocProvider.of(context);

  void getDetails(int id) async {
    emit(DetailsLoadingState());
    DetailsRepo detailsRepo = DetailsRepoImp(detailsDataSource);
    DetailsUseCase detailsUseCase = DetailsUseCase(detailsRepo);
    var result = await detailsUseCase.call(id);
    result.fold(
          (l) => emit(DetailsErrorState(l)),
      (r) {
        detailsResponseModel=r;
        emit(DetailsSuccessState(r ));
      },

    );
  }
  void getEquipment(int id) async {
    emit(EquipmentLoadingState());
    DetailsRepo detailsRepo = DetailsRepoImp(detailsDataSource);
    EquipmentUseCase equipmentUseCase = EquipmentUseCase(detailsRepo);
    var result = await equipmentUseCase.call(id);
    result.fold(
          (l) => emit(EquipmentErrorState(l)),
      (r) {
            equipmentResponseModel = r;
        emit(EquipmentSuccessState(r ));
      },

    );
  }
  void getNutrition(int id) async {
    emit(NutritionLoadingState());
    DetailsRepo detailsRepo = DetailsRepoImp(detailsDataSource);
    NutritionUseCase nutritionUseCase = NutritionUseCase(detailsRepo);
    var result = await nutritionUseCase.call(id);
    result.fold(
          (l) => emit(NutritionErrorState(l)),
      (r) {
            nutritionResponseModel = r;
        emit(NutritionSuccessState(r ));
      },

    );
  }
  void getSimilar(int id) async {
    emit(SimilarLoadingState());
    DetailsRepo detailsRepo = DetailsRepoImp(detailsDataSource);
SimilarUseCase similarUseCase = SimilarUseCase(detailsRepo);
    var result = await similarUseCase.call(id);
    result.fold(
          (l) => emit(SimilarErrorState(l)),
      (r) {
            similarResponseModel = r;
            emit(SimilarSuccessState(r ));
      },

    );

  }

  void toggleInstructions() {
    isInstructionExpanded = !isInstructionExpanded;
    emit(ChangeInstructionExpandedState());
  }

  void toggleStep(String stepKey) {
    if (expandedStepKeys.contains(stepKey)) {
      expandedStepKeys.remove(stepKey);
    } else {
      expandedStepKeys.add(stepKey);
    }
    emit(ChangeInstructionExpandedState());
  }
}
