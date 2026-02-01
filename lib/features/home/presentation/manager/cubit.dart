import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/home/data/data_sources/home_data_source.dart';
import 'package:recipe/features/home/data/repositories/home_repo_imp.dart';
import 'package:recipe/features/home/domain/repositories/home_repo.dart';
import 'package:recipe/features/home/domain/use_cases/random_use_case.dart';
import 'package:recipe/features/home/presentation/manager/states.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeDataSource homeDataSource;
  List<dynamic> breakFastList = [];
  List<dynamic> lunchList = [];
  List<dynamic> dinnerList = [];
  List<dynamic> drinkList = [];

  HomeTabCubit(this.homeDataSource) : super(HomeTabState());

  static HomeTabCubit get(context) => BlocProvider.of(context);

  void breakFastRecipe() async {
    emit(BreakFastLoadingState());
    HomeRepo homeRepo = HomeRepoImp(homeDataSource: homeDataSource);
    RandomUseCase randomUseCase = RandomUseCase(homeRepo);
    var response = await randomUseCase.call("breakfast", 50);
    response.fold(
      (l) => emit(BreakFastErrorState(l)),
      (r) {
        breakFastList = r;
        emit(BreakFastSuccessState(r));
        print( " title${r.first.title}");
      },
    );
  }
  void lunchRecipe() async {
    emit(LunchLoadingState());
    HomeRepo homeRepo = HomeRepoImp(homeDataSource: homeDataSource);
    RandomUseCase randomUseCase = RandomUseCase(homeRepo);
    var response = await randomUseCase.call("lunch", 50);
    response.fold(
      (l) => emit(LunchErrorState(l)),
      (r) {
        lunchList = r;
        emit(LunchSuccessState(r));
        print( " title${r.first.title}");
      },
    );
  }
  void dinnerRecipe() async {
    emit(DinnerLoadingState());
    HomeRepo homeRepo = HomeRepoImp(homeDataSource: homeDataSource);
    RandomUseCase randomUseCase = RandomUseCase(homeRepo);
    var response = await randomUseCase.call("lunch", 50);
    response.fold(
      (l) => emit(DinnerErrorState(l)),
      (r) {
        dinnerList = r;
        emit(DinnerSuccessState(r));
        print( " title${r.first.title}");
      },
    );
  }
  void drinkRecipe() async {
    emit(DrinkLoadingState());
    HomeRepo homeRepo = HomeRepoImp(homeDataSource: homeDataSource);
    RandomUseCase randomUseCase = RandomUseCase(homeRepo);
    var response = await randomUseCase.call("drink", 50);
    response.fold(
      (l) => emit(DrinkErrorState(l)),
      (r) {
        drinkList = r;
        emit(DrinkSuccessState(r));
        print( " title${r.first.title}");
      },
    );
  }
}
