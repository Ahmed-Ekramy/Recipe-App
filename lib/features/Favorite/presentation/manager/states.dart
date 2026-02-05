import 'package:recipe/features/Favorite/data/models/favorite_model.dart';


abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteModel> favorites;
  FavoriteSuccess(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError(this.error);
}

class FavoriteToggleSuccess extends FavoriteState {}