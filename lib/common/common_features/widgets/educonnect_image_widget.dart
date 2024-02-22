import 'package:flutter/material.dart';

import '../../educonnect_assets.dart';

class IschoolerImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeHolderImage;
  final bool circleShape;
  const IschoolerImageWidget.asset({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    this.url = '',
    this.circleShape = false,
  });

  const IschoolerImageWidget.network({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    this.url = '',
    this.circleShape = false,
  });

  @override
  Widget build(BuildContext context) {
    return circleShape
        ? ClipOval(
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: imageWidget(),
          )
        : imageWidget();
  }

  Widget imageWidget() {
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
    return Image.asset(placeHolderImage ?? IschoolerAssets.authImage,
        width: width,
        height: height,
        fit: fit, errorBuilder: (context, error, stackTrace) {
      return Container();
    });
  }
}
