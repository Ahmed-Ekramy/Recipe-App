import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/utils/componants.dart';
import 'package:recipe/features/Favorite/presentation/pages/favorite_view.dart';
import 'package:recipe/features/details/presentation/pages/recipe_details.dart';
import 'package:recipe/features/home_layout/presentation/manager/cubit.dart';
import 'package:recipe/features/home_layout/presentation/pages/home_layout_view.dart';
import 'package:recipe/features/search/presentation/pages/filter_search_view.dart';
import 'package:recipe/features/search/presentation/pages/search_view.dart';

class Routes {
  static const String signUp = "signUp";
  static const String login = "login";
  static const String layout = "/";
  static const String search = "search";
  static const String favorite = "favorite";
  static const String filter = "filter";
  static const String recipeDetails = "recipeDetails";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case(Routes.layout):
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: HomeLayoutView(),
          );
        },);
      case(Routes.search):
        return MaterialPageRoute(builder: (context) {
          return const SearchView();
        },);
      case(Routes.favorite):
        return MaterialPageRoute(builder: (context) {
          return const FavoriteView();
        },);
      case(Routes.filter):
        return MaterialPageRoute(builder: (context) {
          return const FilterSearchView();
        },);
      case(Routes.recipeDetails):
        return MaterialPageRoute(builder: (context) {
          return const RecipeDetails();
        },);
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}