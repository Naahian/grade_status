import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 435;
  bool get isDesktop => MediaQuery.of(this).size.width > 435;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension ConstantExtension on BuildContext {
  double get paddingDesktop => 160;
  double get paddingMobile => 25;
}

extension TextThemeExtension on BuildContext {
  TextStyle get headline => Theme.of(this).textTheme.headlineMedium!.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      );
  TextStyle get title => Theme.of(this).textTheme.headlineLarge!.copyWith(
        fontSize: 42.sp,
        fontWeight: FontWeight.bold,
      );
  TextStyle get subTitle => Theme.of(this).textTheme.headlineSmall!.copyWith(
        fontSize: 18.sp,
        color: Theme.of(this).brightness == Brightness.light
            ? const Color(0xff666666)
            : const Color(0xffaaaaaa),
      );
  TextStyle get bodyText => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 12.sp,
      );
}
