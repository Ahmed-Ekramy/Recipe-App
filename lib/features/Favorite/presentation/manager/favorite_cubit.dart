import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';
import 'package:recipe/features/Favorite/domain/repositories/favorite_repo.dart';
import 'package:recipe/features/Favorite/presentation/manager/states.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  void getFavorites() async {
    emit(FavoriteLoading());
    final result = await favoriteRepo.getFavorites();
    result.fold(
      (l) => emit(FavoriteError(l)),
      (r) => emit(FavoriteSuccess(r)),
    );
  }

  void addFavorite(FavoriteModel recipe) async {
    final result = await favoriteRepo.addFavorite(recipe);
    result.fold(
      (l) => emit(FavoriteError(l)),
      (r) {
        emit(FavoriteToggleSuccess());
        getFavorites();
      },
    );
  }

  void removeFavorite(int id) async {
    final result = await favoriteRepo.removeFavorite(id);
    result.fold(
      (l) => emit(FavoriteError(l)),
      (r) {
        emit(FavoriteToggleSuccess());
        getFavorites();
      },
    );
  }

  bool isFavorite(int id) {
    return favoriteRepo.isFavorite(id);
  }

  void toggleFavorite(FavoriteModel recipe) async {
    if (isFavorite(recipe.id)) {
      removeFavorite(recipe.id);
    } else {
      addFavorite(recipe);
    }
  }
}
