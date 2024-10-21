import 'package:fake_store_flutter/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreenController extends GetxController {
  String _appVersion = '';
  String _buildNumber = '';

  String get appVersion => _appVersion;

  String get buildNumber => _buildNumber;

  @override
  void onInit() {
    super.onInit();
    // Method to get application version
    _getAppVersion();

    // Method to navigate to the next screen
    goToNextScreen();
  }

  // Method to get application version
  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    _appVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    update();
  }

  // Method to navigate to the next screen
  Future<void> goToNextScreen() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2)).then((_) => Get.offAll(
          () => const HomeScreen(),
          transition: Transition.rightToLeft));
    });
  }
}
