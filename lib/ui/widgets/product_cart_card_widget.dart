import 'package:fake_store_flutter/constants/colors.dart';
import 'package:fake_store_flutter/data/models/product_model.dart';
import 'package:fake_store_flutter/ui/utils/package_dependency_wrapper.dart';
import 'package:fake_store_flutter/ui/widgets/custom_stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCartCardWidget extends StatelessWidget {
  final ProductModel product;
  final int productIndex;
  final VoidCallback onIncrement, onDecrement, onDelete;

  const ProductCartCardWidget({
    super.key,
    required this.product,
    required this.productIndex,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colorWhiteHighEmp,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Wrapper.setCachedNetworkImage(
                imageUrl: product.image ?? '',
                height: 73.h,
                width: 73.h,
                radiusCircular: 8.r,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          'Product ${productIndex + 1}: ${product.title}',
                          style: textTheme.labelLarge
                              ?.copyWith(color: colorTextBlackMediumEmp),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: onDelete,
                        child: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
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
                      CustomStepperWidget(
                        quantity: product.quantity,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
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
