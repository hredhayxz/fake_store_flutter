import 'package:fake_store_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepperWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomStepperWidget({
    super.key,
    required this.quantity,
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
        // Decrement section
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onDecrement,
          child: Container(
            width: 22.h,
            height: 22.h,
            decoration: ShapeDecoration(
              color: colorStatusAlertLow,
              shape: OvalBorder(
                side: BorderSide(width: 1.w, color: colorStatusWarning),
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
        // Increment section
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onIncrement,
          child: Container(
            width: 22.h,
            height: 22.h,
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
