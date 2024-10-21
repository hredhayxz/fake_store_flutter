import 'package:fake_store_flutter/constants/colors.dart';
import 'package:fake_store_flutter/data/models/product_model.dart';
import 'package:fake_store_flutter/ui/utils/package_dependency_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartCardWidget extends StatelessWidget {
  final ProductModel product;
  final int productIndex;

  const ProductCartCardWidget({
    super.key,
    required this.product,
    required this.productIndex,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.w, color: colorNatural200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.r,
          left: 4.r,
          right: 16.r,
          bottom: 16.r,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrapper.setCachedNetworkImage(
              imageUrl: product.image ?? '',
              height: 73.h,
              width: 73.h,
              radiusCircular: 8.r,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    'Product ${productIndex + 1}: ${product.title}',
                    style: textTheme.labelLarge
                        ?.copyWith(color: colorTextBlackMediumEmp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: textTheme.labelLarge,
                      ),
                      SizedBox(width: 12.w),
                      CustomStepper(
                        quantity: 3,
                        productIndex: 1,
                        onIncrement: () {},
                        onDecrement: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  final int quantity;
  final int productIndex;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomStepper({
    super.key,
    required this.quantity,
    required this.productIndex,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onDecrement,
          child: Container(
            width: 26.h,
            height: 26.h,
            decoration: ShapeDecoration(
              color: colorNatural100,
              shape: OvalBorder(
                side: BorderSide(width: 1.w, color: colorBtnDisable),
              ),
            ),
            child: const Icon(Icons.remove, color: colorBtnDisable),
          ),
        ),
        SizedBox(width: 12.h),
        Text(
          quantity.toString(),
          style: textTheme.headlineMedium?.copyWith(fontSize: 14.sp),
        ),
        SizedBox(width: 12.h),
        InkWell(
          onTap: onIncrement,
          child: Container(
            width: 26.h,
            height: 26.h,
            decoration: ShapeDecoration(
              color: colorStatusAlertLow,
              shape: OvalBorder(
                side: BorderSide(width: 1.w, color: colorStatusWarning),
              ),
            ),
            child: const Icon(Icons.add, color: colorStatusWarning),
          ),
        ),
      ],
    );
  }
}
