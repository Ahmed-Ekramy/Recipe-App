import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe/features/Favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>(FavoriteLocalDataSourceImpl.kFavoriteBox);
  runApp(const MyApp());
}

