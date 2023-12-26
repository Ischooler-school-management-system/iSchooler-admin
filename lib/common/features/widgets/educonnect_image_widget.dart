import 'package:flutter/material.dart';

import '../../educonnect_assets.dart';

class EduconnectImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeHolderImage;
  const EduconnectImageWidget.asset({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    this.url = '',
  });

  const EduconnectImageWidget.network({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    this.url = '',
  });

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      // Handle empty URL
      return _buildPlaceholderImage();
    }

    if (url.startsWith('asset')) {
      return Image.asset(
        url,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
      );
    } else if (url.startsWith('http') || url.startsWith('https')) {
      return Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
      );
    } else {
      // Handle invalid URL
      return _buildPlaceholderImage();
    }
  }

  Widget _buildPlaceholderImage() {
    // Return a placeholder image or default behavior for invalid or empty URL
    return Image.asset(placeHolderImage ?? EduconnectAssets.authImage,
        width: width,
        height: height,
        fit: fit, errorBuilder: (context, error, stackTrace) {
      return Container();
    });
  }
}
