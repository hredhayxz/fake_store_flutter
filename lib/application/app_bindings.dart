import 'package:fake_store_flutter/controller/home_screen_controller.dart';
import 'package:fake_store_flutter/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => HomeScreenController(), fenix: true);
  }
}
