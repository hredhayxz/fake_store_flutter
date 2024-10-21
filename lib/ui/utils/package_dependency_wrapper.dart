import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class Wrapper {
  Wrapper._();

  /// For Cached Network image
  static Widget setCachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    double? radiusCircular,
    BoxFit fit = BoxFit.cover,
    Color placeholderColor = Colors.grey,
    IconData errorIcon = Icons.image,
  }) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) => setShimmerEffect(
          height: height, width: width, radiusCircular: radiusCircular),
      imageUrl: imageUrl,
      errorWidget: (_, __, ___) => Icon(errorIcon),
    );
  }

  /// For Shimmer effect
  static Widget setShimmerEffect({
    double? width,
    double? height,
    double? radiusCircular,
    Color placeholderColor = Colors.grey,
  }) {
    return Shimmer.fromColors(
      baseColor: placeholderColor,
      highlightColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radiusCircular ?? 0),
        child: Container(
          width: width ?? 17.w,
          height: height ?? 4.h,
          color: placeholderColor,
        ),
      ),
    );
  }
}
