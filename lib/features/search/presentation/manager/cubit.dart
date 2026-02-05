import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/search/data/data_sources/search_data_source.dart';
import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';
import 'package:recipe/features/search/data/repositories/search_repo_imp.dart';
import 'package:recipe/features/search/domain/repositories/search_repo.dart';
import 'package:recipe/features/search/domain/use_cases/autocomplete_use_case.dart';
import 'package:recipe/features/search/domain/use_cases/complex_search_use_case.dart';
import 'package:recipe/features/search/presentation/manager/states.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchDataSource searchDataSource;
  List<AutocompleteResponseModel> autoSearchList = [];

  SearchCubit(this.searchDataSource) : super(IntalSearchState());

  BlocProvider get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();

  List<String> ingredients = [];
  RangeValues calories = const RangeValues(0, 100);
  RangeValues protein = const RangeValues(0, 100);
  RangeValues fat = const RangeValues(0, 100);
  RangeValues carbs = const RangeValues(0, 100);

  void addIngredient() {
    final ingredient = ingredientController.text.trim();
    if (ingredient.isNotEmpty) {
      ingredients.add(ingredient);
      ingredientController.clear();
      emit(FilterUpdateState());
    }
  }

  void removeIngredient(int index) {
    ingredients.removeAt(index);
    emit(FilterUpdateState());
  }

  void updateCalories(RangeValues values) {
    calories = values;
    emit(FilterUpdateState());
  }

  void updateProtein(RangeValues values) {
    protein = values;
    emit(FilterUpdateState());
  }

  void updateFat(RangeValues values) {
    fat = values;
    emit(FilterUpdateState());
  }

  void updateCarbs(RangeValues values) {
    carbs = values;
    emit(FilterUpdateState());
  }

  void resetFilters() {
    ingredients.clear();
    ingredientController.clear();
    calories = const RangeValues(0, 100);
    protein = const RangeValues(0, 100);
    fat = const RangeValues(0, 100);
    carbs = const RangeValues(0, 100);
    emit(FilterUpdateState());
  }

  void autoSearch(String query) async {
    emit(LoadingAutoSearchState());
    SearchRepo searchRepo = SearchRepoImp(searchDataSource: searchDataSource);
    AutocompleteUseCase autoSearchUseCase = AutocompleteUseCase(searchRepo);
    var result = await autoSearchUseCase.call(query);
    result.fold((l) => emit(ErrorAutoSearchState(l)), (r) {
      autoSearchList = r;
      emit(SuccessAutoSearchState(r));
    });
  }

  void complexSearch(String query) async {
    emit(LoadingComplexSearchState());
    SearchRepo searchRepo = SearchRepoImp(searchDataSource: searchDataSource);
    ComplexSearchUseCase complexSearchUseCase = ComplexSearchUseCase(
      searchRepo,
    );

    const defaultRange = RangeValues(0, 100);

    var result = await complexSearchUseCase.call(
      query,
      includeIngredients: ingredients.isNotEmpty ? ingredients.join(',') : null,
      minCalories: calories != defaultRange ? calories.start : null,
      maxCalories: calories != defaultRange ? calories.end : null,
      minProtein: protein != defaultRange ? protein.start : null,
      maxProtein: protein != defaultRange ? protein.end : null,
      minFat: fat != defaultRange ? fat.start : null,
      maxFat: fat != defaultRange ? fat.end : null,
      minCarbs: carbs != defaultRange ? carbs.start : null,
      maxCarbs: carbs != defaultRange ? carbs.end : null,
    );
    result.fold((l) => emit(ErrorComplexSearchState(l)), (r) {
      emit(SuccessComplexSearchState(r));
    });
  }
}

