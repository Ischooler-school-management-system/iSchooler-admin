import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ischooler_assets.dart';
import '../../style/ischooler_colors.dart';

class IschoolerImageWidget extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeHolderImage;
  final double? circleAvatarRadius;

  const IschoolerImageWidget({
    super.key,
    this.width,
    this.height,
    this.fit,
    this.placeHolderImage,
    required this.url,
    this.circleAvatarRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      // Handle empty URL
      return circleAvatarRadius == null
          ? _buildPlaceholderImage()
          : _circlePlaceHolderImage();
    } else {
      if (url!.startsWith('assets')) {
        if (circleAvatarRadius != null) {
          return CircleAvatar(
            radius: circleAvatarRadius,
            backgroundImage: AssetImage(url!),
          );
        } else {
          return Image.asset(
            url!,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholderImage();
            },
          );
        }
      } else if (url!.startsWith('http') || url!.startsWith('https')) {
        if (circleAvatarRadius != null) {
          return networkCircleAvatar();
        } else {
          return Image.network(
            url!,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholderImage();
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: IschoolerColors.white,
                    color: IschoolerColors.blue,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          );
        }
      } else {
        // Handle invalid URL
        return _buildPlaceholderImage();
      }
    }
  }

  networkCircleAvatar() {
    return CachedNetworkImage(
      imageUrl: url!,
      errorWidget: (context, url, error) => _circlePlaceHolderImage(),
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          radius: circleAvatarRadius,
          backgroundImage: imageProvider,
        );
      },
    );
  }

  CircleAvatar _circlePlaceHolderImage() {
    return CircleAvatar(
      radius: circleAvatarRadius,
      backgroundImage: AssetImage(IschoolerAssets.blankProfileImage),
    );
  }

  Widget _buildPlaceholderImage() {
    // Return a placeholder image or default behavior for invalid or empty URL

    return Image.asset(
      placeHolderImage ?? IschoolerAssets.blankProfileImage,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container();
      },
    );
  }
}
