import 'package:flutter/material.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/home/presentation/widgets/drink_item.dart';
import 'package:recipe/features/home/presentation/widgets/menu_item.dart';
import 'package:recipe/features/home/presentation/widgets/popular_breakfast_item.dart';
import '../../data/models/list_menu_model.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});

  final List menuList = [
    MenuModel("Pizza", AppImages.pizza),
    MenuModel("Burger", AppImages.burger),
    MenuModel("Meat", AppImages.meat),
    MenuModel("Fish", AppImages.fish),
    MenuModel("Chicken", AppImages.chicken),
    MenuModel("Pasta", AppImages.pasta),
    MenuModel("Soups", AppImages.soups),
    MenuModel("Noodles", AppImages.noodles),
    MenuModel("Vegetarian", AppImages.vegetarian),
    MenuModel("Baking", AppImages.baking),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), centerTitle: true, backgroundColor:  Colors.transparent,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.orange.shade300, Colors.orange.shade50],
                  ),
                ),
                child: Image.asset(AppImages.surface),
              ),
              SizedBox(height: 10),
              Text(
                "Simple way to find tasty food",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) =>
                      MenuItem(menuList: menuList, index: index),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Breakfast",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularBreakfastItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Breakfast",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularBreakfastItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Breakfast",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => PopularBreakfastItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Drink",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => DrinkItem(),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: 5,
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}


