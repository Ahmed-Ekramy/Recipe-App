import 'package:dartz/dartz.dart';
import 'package:recipe/features/Favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';
import 'package:recipe/features/Favorite/domain/repositories/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepoImpl(this.localDataSource);

  @override
  Future<Either<String, void>> addFavorite(FavoriteModel recipe) async {
    try {
      await localDataSource.addFavorite(recipe);
      return const Right(null);
    } catch (e) {
      return Left( e.toString());
    }
  }

  @override
  Future<Either<String, void>> removeFavorite(int id) async {
    try {
      await localDataSource.removeFavorite(id);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<FavoriteModel>>> getFavorites() async {
    try {
      final favorites = localDataSource.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  bool isFavorite(int id) {
    return localDataSource.isFavorite(id);
  }
}
