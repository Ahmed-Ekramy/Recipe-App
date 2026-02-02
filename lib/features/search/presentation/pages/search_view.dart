import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/shared_widget/custom_text_form_field.dart';
import 'package:recipe/core/utils/app_images.dart';
import 'package:recipe/features/details/presentation/widgets/search_result_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              cursorColor: Colors.orange,
              backgroundColor: Colors.orange.shade50,
              maxLines: 1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              hintText: "Search Recipe",
              hintColor: Colors.brown,
              focusedBorderColor: Colors.orange,
              enabledBorderColor: Colors.white70,
              onFieldSubmitted: (value) {},
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
            SizedBox(height: 20),
            Text(
              " Search Result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.separated(
              itemCount: 20,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SearchResultItem(),
              separatorBuilder: (context, index) => SizedBox(height: 10),
            ),
          ],
        ),
      ),
    );
  }
}

