import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int? readyInMinutes;

  @HiveField(4)
  final double? aggregateLikes;

  FavoriteModel({
    required this.id,
    required this.title,
    required this.image,
    this.readyInMinutes,
    this.aggregateLikes,
  });

  factory FavoriteModel.fromResult(dynamic result) {
    return FavoriteModel(
      id: result.id ?? 0,
      title: result.title ?? '',
      image: result.image ?? '',
      readyInMinutes: null,
    );
  }
}
