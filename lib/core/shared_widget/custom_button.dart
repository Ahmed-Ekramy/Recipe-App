import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomElevButton extends StatelessWidget {
  const CustomElevButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    this.height,
    this.width,
    this.textStyle,
    this.colorButton,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String buttonName;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? colorButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero ,
        elevation: 3,
        shadowColor: Colors.blueAccent,
        backgroundColor : colorButton ?? Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(width ?? double.infinity, height ?? 48),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
        height: 22,
        width: 22,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.blueAccent,
        ),
      )
          : Text(
        buttonName,
        style: textStyle ??
            TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
    )
    );
  }
}
