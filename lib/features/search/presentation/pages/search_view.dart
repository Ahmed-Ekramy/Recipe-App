import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/api/dio_consumer.dart';
import 'package:recipe/core/shared_widget/custom_text_form_field.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/details/presentation/widgets/search_result_item.dart';
import 'package:recipe/features/search/data/data_sources/search_remote.dart';
import 'package:recipe/features/search/presentation/manager/cubit.dart';
import 'package:recipe/features/search/presentation/manager/states.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) =>
            SearchCubit(SearchRemote(apiConsumer: DioConsumer(dio: Dio()))),
      child: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                onChanged: (value) {
                  BlocProvider.of<SearchCubit>(context).autoSearch(value);
                },
                cursorColor: Colors.orange,
                backgroundColor: Colors.orange.shade50,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                hintText: "Search Recipe",
                hintColor: Colors.brown,
                focusedBorderColor: Colors.orange,
                enabledBorderColor: Colors.white70,
                onFieldSubmitted: (value) {
                  Navigator.pushNamed(context, 'searchResult', arguments: value);
                },
                prefixIcon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.search,
                      width: 25,
                      height: 25,
                      colorFilter: const ColorFilter.mode(
                        Colors.orange,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'filter');
                  },
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.filter,
                        width: 25,
                        height: 25,
                        colorFilter: const ColorFilter.mode(
                          Colors.brown,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                " Search Suggestions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  SearchCubit cubit = BlocProvider.of<SearchCubit>(context);
                  var autoSearchList = cubit.autoSearchList;
                  if (state is ErrorAutoSearchState) {
                    return Center(child: Text(state.error));
                  }
                  if (state is LoadingAutoSearchState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is SuccessAutoSearchState) {

                    return ListView.separated(
                      itemCount: autoSearchList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          cubit.searchController.text = autoSearchList[index].title??"";
                          Navigator.pushNamed(context, 'searchResult', arguments: autoSearchList[index].title);
                        },
                        child: SearchResultItem(
                            autoSearchList[index]
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
