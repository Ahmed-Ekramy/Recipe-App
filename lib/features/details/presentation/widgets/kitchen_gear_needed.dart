import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe/core/utils/app_images.dart';

class KitchenGearNeeded extends StatelessWidget {

  const KitchenGearNeeded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border:  Border.all(color: Colors.brown.shade50, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown.shade200,
            ),
            child: SvgPicture.asset(
              AppImages.burger,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "Burger",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
