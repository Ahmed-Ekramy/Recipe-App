
import 'package:flutter/material.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/features/Favorite/presentation/pages/favorite_view.dart';
import 'package:recipe/features/home/presentation/pages/home_tab_view.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/features/Favorite/data/data_sources/favorite_local_data_source.dart';
import 'package:recipe/features/Favorite/data/repositories/favorite_repo_impl.dart';
import 'package:recipe/features/Favorite/presentation/manager/favorite_cubit.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCubit(
            FavoriteRepoImpl(FavoriteLocalDataSourceImpl()),
          )..getFavorites(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
        initialRoute: Routes.layout,
      ),
    );
  }
}
