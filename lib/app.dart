
import 'package:flutter/material.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/features/Favorite/presentation/pages/favorite_view.dart';
import 'package:recipe/features/home/presentation/pages/home_tab_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner:  false,
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
      initialRoute: Routes.layout,
    );
  }
}
