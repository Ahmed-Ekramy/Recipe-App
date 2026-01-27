
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/pages/home_tab_view.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner:  false,
      home: HomeTabView(),
    );
  }
}
