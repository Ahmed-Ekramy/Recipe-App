import 'package:recipe/features/details/data/models/details_model.dart';
import 'package:recipe/features/details/data/models/equipment_model.dart';
import 'package:recipe/features/details/data/models/nutrition_model.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';

class DetailsState{}
class DetailsInitialState extends DetailsState{}
class DetailsLoadingState extends DetailsState{}
class DetailsSuccessState extends DetailsState{
  final DetailsResponseModel detailsResponseModel;
  DetailsSuccessState(this.detailsResponseModel);
}
class DetailsErrorState extends DetailsState{
  final String errMessage;
  DetailsErrorState(this.errMessage);
}

class  NutritionLoadingState extends DetailsState{}
class  NutritionSuccessState extends DetailsState{
  final  NutritionResponseModel nutritionResponseModel;
  NutritionSuccessState(this.nutritionResponseModel);
}
class  NutritionErrorState extends DetailsState{
  final String errMessage;
  NutritionErrorState(this.errMessage);
}

class EquipmentLoadingState extends DetailsState{}
class EquipmentSuccessState extends DetailsState{
  final EquipmentResponseModel equipmentResponseModel;
  EquipmentSuccessState(this.equipmentResponseModel);
}
class EquipmentErrorState extends DetailsState{
  final String errMessage;
  EquipmentErrorState(this.errMessage);
}
class SimilarLoadingState extends DetailsState{}
class SimilarSuccessState extends DetailsState{
  final List<SimilarResponseModel> similarResponseModel;
  SimilarSuccessState(this.similarResponseModel);
}
class SimilarErrorState extends DetailsState{
  final String errMessage;
  SimilarErrorState(this.errMessage);
}

class ChangeInstructionExpandedState extends DetailsState{}
