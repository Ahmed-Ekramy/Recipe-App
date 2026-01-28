import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/utils/app_images.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration:  BoxDecoration(
          border:  Border.all(color: Colors.orange.shade100),
          borderRadius: BorderRadius.circular(10),
          color:  Colors.white
      ),
      child: Row(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(AppImages.recipe, width: 70, height: 70, fit: BoxFit.cover)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fried Potatoes",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.kcal,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.orange,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        " 120 kcal",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.time,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.orange,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        " 120 mins",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppImages.heartAdd,
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                  Colors.orange,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: 10),
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
                  child: Text("\$20/serve", style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),)
              ),

            ],)
        ],
      ),
    );
  }
}
