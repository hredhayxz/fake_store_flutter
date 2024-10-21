import 'package:fake_store_flutter/controller/home_screen_controller.dart';
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
          GetBuilder<HomeScreenController>(builder: (_) {
            return CustomCartIconButtonWidget(
              itemCount: 10,
              onCartIconTap: () {},
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
              onAddToCart: () {},
              product: controller.allProducts[index],
            );
          },
        );
      }),
    );
  }
}
