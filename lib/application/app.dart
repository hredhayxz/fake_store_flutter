import 'package:fake_store_flutter/application/app_bindings.dart';
import 'package:fake_store_flutter/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FakeStoreEComApp extends StatelessWidget {
  const FakeStoreEComApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size.width > 600
          ? const Size(834, 1194) // Tablet design size
          : const Size(428, 926), // Mobile design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fake Store E-Com App',
          initialBinding: AppBindings(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
