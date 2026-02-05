import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/config/routes/routes.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/details/presentation/manager/cubit.dart';
import 'package:recipe/features/details/presentation/manager/states.dart';
import 'package:recipe/features/details/presentation/widgets/info_item.dart';
import 'package:recipe/features/details/presentation/widgets/kitchen_gear_needed.dart';
import 'package:recipe/features/details/presentation/widgets/nutrition_info_widget.dart';
import 'package:recipe/features/details/presentation/widgets/similar_item.dart';
import 'package:recipe/features/details/presentation/widgets/instructions_widget.dart';
import 'package:recipe/features/Favorite/presentation/manager/favorite_cubit.dart';
import 'package:recipe/features/Favorite/presentation/manager/states.dart';
import 'package:recipe/features/Favorite/data/models/favorite_model.dart';

class RecipeDetails extends StatelessWidget {
  final int id;

  const RecipeDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is DetailsSuccessState ||
                state is EquipmentSuccessState ||
                state is NutritionSuccessState ||
                state is SimilarSuccessState || state is ChangeInstructionExpandedState) {

              var cubit = DetailsCubit.get(context);
              var detailsResponseModel = cubit.detailsResponseModel;
              var equipmentResponseModel =
                  cubit.equipmentResponseModel?.equipment;
              var nutritionResponseModel = cubit.nutritionResponseModel;
              var similarResponseModel = cubit.similarResponseModel;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: CachedRecipeImage(
                            imageUrl: detailsResponseModel?.image ?? "",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black38,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, favState) {
                              final isFav = FavoriteCubit.get(context).isFavorite(id);
                              return GestureDetector(
                                onTap: () {
                                  if (detailsResponseModel != null) {
                                    FavoriteCubit.get(context).toggleFavorite(
                                      FavoriteModel(
                                        id: detailsResponseModel.id ?? 0,
                                        title: detailsResponseModel.title ?? '',
                                        image: detailsResponseModel.image ?? '',
                                        readyInMinutes: detailsResponseModel.readyInMinutes,
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black38,
                                  ),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    AppImages.heartAdd,
                                    fit: BoxFit.contain,
                                    width: 30,
                                    height: 30,
                                    colorFilter: ColorFilter.mode(
                                      isFav ? Colors.orange : Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black38,
                              ),
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                "${detailsResponseModel?.title}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -60,
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),

                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InfoItem(
                                    text:
                                        "${nutritionResponseModel?.calories ?? 0} Kcal",
                                    icon: AppImages.kcal,
                                  ),
                                  const SizedBox(width: 2),
                                  VerticalDivider(
                                    color: Colors.orange.shade100,
                                    thickness: 1,
                                  ),
                                  InfoItem(
                                    text:
                                        "${detailsResponseModel?.readyInMinutes} m",
                                    icon: AppImages.time,
                                  ),
                                  const SizedBox(width: 2),
                                  VerticalDivider(
                                    color: Colors.orange.shade100,
                                    thickness: 1,
                                  ),
                                  InfoItem(
                                    text: "${detailsResponseModel?.servings}",
                                    icon: AppImages.serving,
                                  ),
                                  const SizedBox(width: 2),
                                  VerticalDivider(
                                    color: Colors.orange.shade100,
                                    thickness: 1,
                                  ),
                                  InfoItem(
                                    text:
                                        " ${detailsResponseModel?.pricePerServing}\$",
                                    icon: AppImages.price,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 90)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Ingredients",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${detailsResponseModel?.extendedIngredients?.length ?? 0} items",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 170,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedRecipeImage(
                                    imageUrl:
                                        "https://spoonacular.com/cdn/ingredients_500x500/${detailsResponseModel?.extendedIngredients?[index].image ?? ""}",
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  " ${detailsResponseModel?.extendedIngredients?[index].name ?? ""}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " ${detailsResponseModel?.extendedIngredients?[index].original ?? ""}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 5),
                        itemCount:
                            detailsResponseModel?.extendedIngredients?.length ??
                            0,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 15)),
                  (equipmentResponseModel != null &&
                          equipmentResponseModel.isNotEmpty)
                      ? SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Kitchen Gear Needed",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown.shade300,
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 100,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  itemCount: equipmentResponseModel.length,
                                  itemBuilder: (context, index) =>
                                      KitchenGearNeeded(
                                        equipmentResponseModel,
                                        index,
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 10),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        )
                      : SliverToBoxAdapter(child: SizedBox.shrink()),
                  SliverToBoxAdapter(
                    child: AnalyzedInstructionsWidget(
                      instructions:
                          detailsResponseModel?.analyzedInstructions ?? [],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nutrition Deep Dive ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: NutritionInfoWidget(
                        calories: nutritionResponseModel?.caloriesInt ?? 0,
                        caloriesTotal: 2500,

                        protein: nutritionResponseModel?.proteinInt ?? 0,
                        proteinTotal: 100,

                        carbs: nutritionResponseModel?.carbsInt ?? 0,
                        carbsTotal: 300,

                        fats: nutritionResponseModel?.fatInt ?? 0,
                        fatsTotal: 80,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "Similar Recipe",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.viewAllSimilar,
                                arguments: similarResponseModel,
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:  similarResponseModel?.length??0,
                        itemBuilder: (context, index) => Align(
                          alignment: Alignment.center,
                          child: SimilarItem( similarResponseModel,index),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 5),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20)),
                ],
              );
            } else if (state is DetailsErrorState) {
              return Center(child: Text(state.errMessage));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}


