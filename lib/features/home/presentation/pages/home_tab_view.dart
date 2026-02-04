import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/core/api/dio_consumer.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/home/data/data_sources/home_remote.dart';
import 'package:recipe/features/home/presentation/manager/cubit.dart';
import 'package:recipe/features/home/presentation/manager/states.dart';
import 'package:recipe/features/home/presentation/widgets/drink_item.dart';
import 'package:recipe/features/home/presentation/widgets/menu_item.dart';
import 'package:recipe/features/home/presentation/widgets/popular_breakfast_item.dart';
import '../../data/models/list_menu_model.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});

  final List menuList = [
    MenuModel("pizza", AppImages.pizza),
    MenuModel("burger", AppImages.burger),
    MenuModel("meat", AppImages.meat),
    MenuModel("fish", AppImages.fish),
    MenuModel("chicken", AppImages.chicken),
    MenuModel("pasta", AppImages.pasta),
    MenuModel("soups", AppImages.soups),
    MenuModel("noodles", AppImages.noodles),
    MenuModel("vegetarian", AppImages.vegetarian),
    MenuModel("baking", AppImages.baking),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) =>
            HomeTabCubit(HomeRemote(api: DioConsumer(dio: Dio())))
              ..breakFastRecipe()
              ..lunchRecipe()
              ..dinnerRecipe()
              ..drinkRecipe(),
        child: BlocBuilder<HomeTabCubit, HomeTabState>(
          builder: (context, state) {
            var cubit = HomeTabCubit.get(context);
            var breakFastList = cubit.breakFastList;
            var lunchList = cubit.lunchList;
            var dinnerList = cubit.dinnerList;
            var drinkList = cubit.drinkList;

            if (state is BreakFastLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BreakFastSuccessState ||
                state is LunchSuccessState ||
                state is DinnerSuccessState ||
                state is DrinkSuccessState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.orange.shade300,
                            Colors.orange.shade50,
                          ],
                        ),
                      ),
                      child: Image.asset(AppImages.surface),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Simple way to find tasty food",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: menuList.length,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap:  (){
                                Navigator.pushNamed(
                                  context,
                                  Routes.viewAllCategory,
                                  arguments: {
                                    "category": menuList[index].text,
                                  },
                                );
                              },
                                child: MenuItem(menuList: menuList, index: index)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Breakfast",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'viewAll',
                              arguments: breakFastList,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade50,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade300,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.orange.shade300,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            PopularBreakfastItem(breakFastList, index),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: breakFastList.length,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Lunch",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'viewAll',
                              arguments: lunchList,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade50,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade300,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.orange.shade300,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'recipeDetails',
                              arguments: lunchList[index],
                            );
                          },
                          child: PopularBreakfastItem(lunchList, index),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: lunchList.length,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Dinner",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'viewAll',
                              arguments: dinnerList,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade50,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade300,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.orange.shade300,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            PopularBreakfastItem(dinnerList, index),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Drink",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'viewAll',
                              arguments: drinkList,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange.shade50,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade300,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.orange.shade300,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'recipeDetails',
                            arguments: drinkList[index],
                          );
                        },
                        child: DrinkItem(drinkList, index),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: drinkList.length,
                    ),
                  ],
                ),
              );
            }
            if (state is BreakFastErrorState) {
              return Center(child: Text(state.errMessage));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
