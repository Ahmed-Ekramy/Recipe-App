import 'package:recipe/features/search/data/models/autocomplete_model.dart';
import 'package:recipe/features/search/data/models/complex_search_model.dart';

class SearchState{}
class IntalSearchState extends SearchState{}
class LoadingAutoSearchState extends SearchState{}
class SuccessAutoSearchState extends SearchState{
  final List<AutocompleteResponseModel> autoSearch;
  SuccessAutoSearchState(this.autoSearch);
}
class ErrorAutoSearchState extends SearchState{
  final String error;
  ErrorAutoSearchState(this.error);

}
class LoadingComplexSearchState extends SearchState{}
class SuccessComplexSearchState extends SearchState{
final ComplexSearchModel complexSearchModel;
  SuccessComplexSearchState(this.complexSearchModel);
}
class ErrorComplexSearchState extends SearchState{
  final String error;
  ErrorComplexSearchState(this.error);

}