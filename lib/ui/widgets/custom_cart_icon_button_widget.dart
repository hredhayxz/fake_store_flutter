import 'package:fake_store_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartIconButtonWidget extends StatelessWidget {
  final int itemCount;
  final VoidCallback onCartIconTap;

  const CustomCartIconButtonWidget({
    super.key,
    required this.itemCount,
    required this.onCartIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.r),
      child: Stack(
        children: [
          IconButton(
              icon: const Icon(Icons.shopping_cart), onPressed: onCartIconTap),
          if (itemCount > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2.r),
                constraints: BoxConstraints(
                  minWidth: 20.r,
                  minHeight: 20.r,
                ),
                decoration: const ShapeDecoration(
                  color: Colors.red,
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: Text('$itemCount',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: colorWhiteHighEmp)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
