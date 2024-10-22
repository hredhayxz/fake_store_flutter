import 'package:fake_store_flutter/controller/cart_screen_controller.dart';
import 'package:fake_store_flutter/controller/home_screen_controller.dart';
import 'package:fake_store_flutter/ui/screens/cart_screen.dart';
import 'package:fake_store_flutter/ui/widgets/custom_cart_icon_button_widget.dart';
import 'package:fake_store_flutter/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store'),
        actions: [
          GetBuilder<CartScreenController>(builder: (cartController) {
            return CustomCartIconButtonWidget(
              itemCount: cartController.allCartProducts.length,
              onCartIconTap: () {
                Get.to(() => const CartScreen(),
                    transition: Transition.rightToLeft);
              },
            );
          }),
        ],
      ),
      body: GetBuilder<HomeScreenController>(builder: (_) {
        if (controller.isProductFetching) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.allProducts.isEmpty) {
          return const Center(
            child: Text('No products found!'),
          );
        }

        return GridView.builder(
          padding: EdgeInsets.all(12.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 0.6.r,
          ),
          itemCount: controller.allProducts.length,
          itemBuilder: (context, index) {
            return ProductCardWidget(
              onAddToCart: () {
                Get.find<CartScreenController>()
                    .addProduct(controller.allProducts[index]);
              },
              product: controller.allProducts[index],
            );
          },
        );
      }),
    );
  }
}
