import 'package:dartz/dartz.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';


abstract class FavoriteRepo {
  Future<Either<String, void>> addFavorite(FavoriteModel recipe);
  Future<Either<String, void>> removeFavorite(int id);
  Future<Either<String, List<FavoriteModel>>> getFavorites();
  bool isFavorite(int id);
}
