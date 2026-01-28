import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoItem extends StatelessWidget {
  final  String text;
  final  String icon;
  const  InfoItem({super.key, required this.text, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          fit: BoxFit.contain,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}