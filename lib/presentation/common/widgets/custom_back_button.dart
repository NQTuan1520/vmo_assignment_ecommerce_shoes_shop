import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.arrow_back_ios_new),
    );
  }
}
