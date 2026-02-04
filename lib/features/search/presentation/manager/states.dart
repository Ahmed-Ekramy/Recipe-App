import 'package:recipe/features/search/data/models/autocomplete_model.dart';

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