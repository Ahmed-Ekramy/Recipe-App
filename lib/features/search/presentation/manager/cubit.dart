import 'package:flutter/cupertino.dart';
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
  // List<Result> resultComplexSearchModel = [];


  SearchCubit(this.searchDataSource) : super(IntalSearchState());

  BlocProvider get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

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
    var result = await complexSearchUseCase.call(query);
    result.fold((l) => emit(ErrorComplexSearchState(l)), (r) {

      emit(SuccessComplexSearchState(r));
    });
  }
}
