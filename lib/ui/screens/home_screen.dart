import 'package:fake_store_flutter/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'imageUrl':
            'https://img.freepik.com/premium-photo/colorful-sport-shoes-green_151013-4554.jpg',
        'productName': 'Sport Shoes',
        'price': 49.99,
        'rating': 4.5,
      },
      {
        'imageUrl':
            'https://img.freepik.com/free-photo/blue-sneakers-white-background_1203-7524.jpg',
        'productName': 'Blue Sneakers',
        'price': 59.99,
        'rating': 4.2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.65.r,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCardWidget(
            imageUrl: product['imageUrl'],
            productName: product['productName'],
            price: product['price'],
            rating: product['rating'],
            onAddToCart: () {
              print('${product['productName']} added to cart!');
            },
          );
        },
      ),
    );
  }
}
