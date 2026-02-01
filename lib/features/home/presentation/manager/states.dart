import 'package:recipe/features/home/domain/entities/random_entity.dart';

class HomeTabState{}
class BreakFastLoadingState extends HomeTabState{}
class BreakFastSuccessState extends HomeTabState{
  final List<RandomEntity> randomEntity;
  BreakFastSuccessState(this.randomEntity);
}
class BreakFastErrorState extends HomeTabState{
  final String errMessage;
  BreakFastErrorState(this.errMessage);
}
class LunchLoadingState extends HomeTabState{}
class LunchSuccessState extends HomeTabState{
  final List<RandomEntity> randomEntity;
  LunchSuccessState(this.randomEntity);
}
class LunchErrorState extends HomeTabState{
  final String errMessage;
  LunchErrorState(this.errMessage);
}
class DinnerLoadingState extends HomeTabState{}
class DinnerSuccessState extends HomeTabState{
  final List<RandomEntity> randomEntity;
  DinnerSuccessState(this.randomEntity);
}
class DinnerErrorState extends HomeTabState{
  final String errMessage;
  DinnerErrorState(this.errMessage);
}
class DrinkLoadingState extends HomeTabState{}
class DrinkSuccessState extends HomeTabState{
  final List<RandomEntity> randomEntity;
  DrinkSuccessState(this.randomEntity);
}
class DrinkErrorState extends HomeTabState{
  final String errMessage;
  DrinkErrorState(this.errMessage);
}





