import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/utils/app_images.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 5,
      itemBuilder: (context, index) => FavItem(),


    );
  }
}

class FavItem extends StatelessWidget {
  const FavItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(10),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(AppImages.recipe, width: 500, height: 200, fit: BoxFit.cover)),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,
                  ),
                  child: SvgPicture.asset(
                    AppImages.heartAdd,
                    fit: BoxFit.contain,
                    width: 30,
                    height: 30,
                    colorFilter: ColorFilter.mode(Colors.orange
                        , BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Text("Fried Potatoes", 
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
              Text("12 MIN", style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),),
            ],
          ),
      ],),
    );
  }
}
