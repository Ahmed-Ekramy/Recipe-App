import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/api/api_consumer.dart';
import 'package:recipe/core/api/dio_consumer.dart';
import 'package:recipe/core/utils/componants.dart';
import 'package:recipe/features/Favorite/presentation/pages/favorite_view.dart';
import 'package:recipe/features/details/data/data_sources/details_remote.dart';
import 'package:recipe/features/details/data/models/similar-model.dart';
import 'package:recipe/features/details/presentation/manager/cubit.dart';
import 'package:recipe/features/details/presentation/pages/recipe_details.dart';
import 'package:recipe/features/details/presentation/pages/view_all_similar.dart';
import 'package:recipe/features/home/data/data_sources/home_remote.dart';
import 'package:recipe/features/home/presentation/manager/cubit.dart';
import 'package:recipe/features/home/presentation/pages/home_tab_view.dart';
import 'package:recipe/features/home/presentation/pages/view_all.dart';
import 'package:recipe/features/home/presentation/pages/view_all_category.dart';
import 'package:recipe/features/home_layout/presentation/manager/cubit.dart';
import 'package:recipe/features/home_layout/presentation/pages/home_layout_view.dart';
import 'package:recipe/features/search/data/data_sources/search_remote.dart';
import 'package:recipe/features/search/presentation/manager/cubit.dart';
import 'package:recipe/features/search/presentation/pages/filter_search_view.dart';
import 'package:recipe/features/search/presentation/pages/search_result.dart';
import 'package:recipe/features/search/presentation/pages/search_view.dart';
import 'package:recipe/features/home/domain/entities/random_entity.dart';

class Routes {
  static const String signUp = "signUp";
  static const String login = "login";
  static const String home = "home";
  static const String layout = "/";
  static const String search = "search";
  static const String favorite = "favorite";
  static const String filter = "filter";
  static const String recipeDetails = "recipeDetails";
  static const String viewAll = "viewAll";
  static const String viewAllSimilar = "viewAllSimilar";
  static const String viewAllCategory = "viewAllCategory";
  static const String searchResult = "searchResult";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (Routes.layout):
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => HomeLayoutCubit(),
              child: HomeLayoutView(),
            );
          },
        );
      case (Routes.searchResult):
        final args = routeSettings.arguments;
        if (args is SearchCubit) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: args,
              child: const SearchResult(),
            ),
          );
        }
        final query = args as String? ?? "";
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SearchCubit(
                SearchRemote(apiConsumer: DioConsumer(dio: Dio())),
              )..complexSearch(
                  query,
                ),
              child: const SearchResult(),
            );
          },
        );
      case (Routes.viewAll):
        final args = routeSettings.arguments as List<RandomEntity>;
        return MaterialPageRoute(builder: (context) => ViewAll(args: args));
      case (Routes.viewAllCategory):
        final args = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) =>
                HomeTabCubit(HomeRemote(api: DioConsumer(dio: Dio())))
                  ..categoryRecipe(args['category']),
                child: ViewAllCategory(),
              ),
        );
      case (Routes.viewAllSimilar):
        final args = routeSettings.arguments as List<SimilarResponseModel>;
        return MaterialPageRoute(
          builder: (context) => ViewAllSimilar(args: args),
        );

      case (Routes.home):
        return MaterialPageRoute(
          builder: (context) {
            return HomeTabView();
          },
        );
      case (Routes.search):
        return MaterialPageRoute(
          builder: (context) {
            return SearchView();
          },
        );
      case (Routes.favorite):
        return MaterialPageRoute(
          builder: (context) {
            return const FavoriteView();
          },
        );
      case (Routes.filter):
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SearchCubit(
                SearchRemote(apiConsumer: DioConsumer(dio: Dio())),
              )
                ..resetFilters(),
              child: FilterSearchView(),
            );
          },
        );
      case (Routes.recipeDetails):
        final args = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) {
            int id = args['id'];
            return BlocProvider(
              create: (context) =>
              DetailsCubit(DetailsRemote(DioConsumer(dio: Dio())))
                ..getDetails(id)
                ..getEquipment(id)
                ..getNutrition(id)
                ..getSimilar(id),
              child: RecipeDetails(id: id),
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}
