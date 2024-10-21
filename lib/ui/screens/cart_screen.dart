import 'package:fake_store_flutter/controller/home_screen_controller.dart';
import 'package:fake_store_flutter/ui/widgets/product_cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCartCardWidget(
              product: Get.find<HomeScreenController>().allProducts[0],
              productIndex: index);
        },
        separatorBuilder: (context, index) => SizedBox(height: 4.h),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: SizedBox(
            height: 52.h,
            child: ElevatedButton(onPressed: () {}, child: Text('Amount'))),
      ),
    );
  }
}
