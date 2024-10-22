import 'package:fake_store_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData getAppTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: colorWhiteHighEmp,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true),

      /// Card theme
      cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 3),

      /// Text theme section
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: colorTextBlackMediumEmp,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          fontSize: 16.sp,
          color: Colors.green,
          fontWeight: FontWeight.w600,
        ),
      ),

      /// Icon theme
      iconTheme: IconThemeData(color: Colors.amber, size: 20.r),

      /// Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 4,
          shadowColor: colorBtnShadow,
          textStyle: TextStyle(
            color: colorWhiteHighEmp,
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// Progress Indicator Theme (CircularProgressIndicator)
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: colorPrimary,
        circularTrackColor: colorBorderGrey,
        linearTrackColor: colorBorderGrey,
        refreshBackgroundColor: colorPrimary100,
      ),
    );
  }
}
