import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/cached_recipe_image.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/search/presentation/manager/cubit.dart';
import 'package:recipe/features/search/presentation/manager/states.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is LoadingComplexSearchState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SuccessComplexSearchState) {
             var resultComplexSearchModel = state.complexSearchModel.results;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 5,
                ),
                itemCount:resultComplexSearchModel?.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'recipeDetails',
                        arguments: {"id": resultComplexSearchModel?[index].id},
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedRecipeImage(
                                  imageUrl: "${resultComplexSearchModel?[index].image}",
                                  height: double.infinity,
                                  width: 500,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                  ),
                                  child: SvgPicture.asset(
                                    AppImages.heartAdd,
                                    fit: BoxFit.contain,
                                    width: 30,
                                    height: 30,
                                    colorFilter: ColorFilter.mode(
                                      Colors.orange,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "${resultComplexSearchModel?[index].title}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is ErrorComplexSearchState) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
