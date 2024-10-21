import 'package:fake_store_flutter/constants/colors.dart';
import 'package:fake_store_flutter/ui/utils/package_dependency_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double price;
  final double rating;
  final VoidCallback onAddToCart;

  const ProductCardWidget({
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.rating,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            child: Wrapper.setCachedNetworkImage(
                imageUrl: imageUrl,
                height: 100.h,
                width: Get.width,
                fit: BoxFit.cover),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 12.r, right: 12.r, bottom: 12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: textTheme.labelLarge,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    const Icon(Icons.star),
                    SizedBox(width: 4.w),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: onAddToCart,
                    child: Text('Add to Cart',
                        style: textTheme.bodyLarge
                            ?.copyWith(color: colorWhiteHighEmp)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
