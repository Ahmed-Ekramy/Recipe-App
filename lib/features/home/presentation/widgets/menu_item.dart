
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.menuList,
    required this.index,
  });

  final List<dynamic> menuList;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
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
          child: SvgPicture.asset(
            menuList[index].image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 5),
        Text(
          menuList[index].text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
