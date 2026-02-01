import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedRecipeImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;

  const CachedRecipeImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => Container(
        color: Colors.grey[300],
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Image not available',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
