import 'package:fake_store_flutter/constants/colors.dart';
import 'package:fake_store_flutter/controller/cart_screen_controller.dart';
import 'package:fake_store_flutter/ui/widgets/product_cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartScreenController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Fake Store'),
        ),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
          itemCount: controller.allCartProducts.length,
          itemBuilder: (context, index) {
            return ProductCartCardWidget(
              product: controller.allCartProducts[index],
              productIndex: index,
              onIncrement: () =>
                  controller.addProduct(controller.allCartProducts[index]),
              onDecrement: () =>
                  controller.removeProduct(controller.allCartProducts[index]),
              onDelete: () =>
                  controller.deleteProduct(controller.allCartProducts[index]),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 4.h),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(16.r),
          child: SizedBox(
              height: 52.h,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Pay Amount: \$${controller.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: colorWhiteHighEmp),
                  ))),
        ),
      );
    });
  }
}
