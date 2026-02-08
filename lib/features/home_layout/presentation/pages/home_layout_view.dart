import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/home_layout/presentation/manager/cubit.dart';
import 'package:recipe/features/home_layout/presentation/manager/states.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          appBar: cubit.currentIndex == 0 ? null : cubit.currentIndex == 1
              ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Search",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            ),
          ): cubit.currentIndex==2? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Favorite",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading:  Icon(Icons.arrow_back_ios_new_outlined),
          ):cubit.currentIndex==3?
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Meal Plan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading:  Icon(Icons.arrow_back_ios_new_outlined),
          )  :null,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey.shade500,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  cubit.currentIndex == 0
                      ? AppImages.homeClose
                      : AppImages.homeOpen,
                  colorFilter: ColorFilter.mode(
                    cubit.currentIndex == 0
                        ? Colors.orange
                        : Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  cubit.currentIndex == 1
                      ? AppImages.searchClose
                      : AppImages.search,
                  colorFilter: ColorFilter.mode(
                    cubit.currentIndex == 1
                        ? Colors.orange
                        : Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  cubit.currentIndex == 2
                      ? AppImages.favouriteClose
                      : AppImages.favouriteOpen,
                  colorFilter: ColorFilter.mode(
                    cubit.currentIndex == 2
                        ? Colors.orange
                        : Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                ),
                label: "Favorite",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  cubit.currentIndex == 3
                      ? AppImages.schedule
                      : AppImages.schedule,
                  colorFilter: ColorFilter.mode(
                    cubit.currentIndex == 3
                        ? Colors.orange
                        : Colors.grey.shade500,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                    ),
                label: "Plan",
              )
            ],
          ),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }
}
