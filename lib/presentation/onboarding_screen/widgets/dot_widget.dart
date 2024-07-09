import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

class DotWidget extends StatelessWidget {
  final int currentPage;
  final int index;
  final BuildContext context;
  final MyColorTheme colorTheme;

  const DotWidget(
      {super.key, required this.currentPage, required this.index, required this.context, required this.colorTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 10.h,
      width: currentPage == index ? 40.w : 10.w,
      decoration: BoxDecoration(
        color: currentPage == index ? colorTheme.blueButton : Colors.grey,
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }
}
