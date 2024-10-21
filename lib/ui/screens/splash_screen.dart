import 'package:fake_store_flutter/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Fake Store E-Com App',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          GetBuilder<SplashScreenController>(builder: (controller) {
            return Text(
              'Version: ${controller.appVersion}+${controller.buildNumber}',
              style: const TextStyle(color: Colors.grey),
            );
          }),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
