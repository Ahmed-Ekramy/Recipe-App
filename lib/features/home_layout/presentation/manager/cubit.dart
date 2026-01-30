import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/Favorite/presentation/pages/favorite_view.dart';
import 'package:recipe/features/home/presentation/pages/home_tab_view.dart';
import 'package:recipe/features/home_layout/presentation/manager/states.dart';
import 'package:recipe/features/search/presentation/pages/search_view.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);

 int currentIndex =0;
void changeIndex(int index){
  currentIndex=index;
  emit(ChangeIndexNavState());
}

  List<Widget> screens = [
     HomeTabView(),
    SearchView(),
    FavoriteView(),
  ];
}