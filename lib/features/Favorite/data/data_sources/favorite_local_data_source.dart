import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addFavorite(FavoriteModel recipe);
  Future<void> removeFavorite(int id);
  List<FavoriteModel> getFavorites();
  bool isFavorite(int id);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  static const String kFavoriteBox = 'favorite_box';

  @override
  Future<void> addFavorite(FavoriteModel recipe) async {
    var box = Hive.box<FavoriteModel>(kFavoriteBox);
    await box.put(recipe.id, recipe);
  }

  @override
  Future<void> removeFavorite(int id) async {
    var box = Hive.box<FavoriteModel>(kFavoriteBox);
    await box.delete(id);
  }

  @override
  List<FavoriteModel> getFavorites() {
    var box = Hive.box<FavoriteModel>(kFavoriteBox);
    return box.values.toList();
  }

  @override
  bool isFavorite(int id) {
    var box = Hive.box<FavoriteModel>(kFavoriteBox);
    return box.containsKey(id);
  }
}
