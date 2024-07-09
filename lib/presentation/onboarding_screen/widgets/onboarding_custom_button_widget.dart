import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../common/widgets/custom_button_widget.dart';

class OnboardingCustomButtonWidget extends StatelessWidget {
  final MyColorTheme colorTheme;
  final void Function() onTap;
  final String? textButton;
  const OnboardingCustomButtonWidget({super.key, required this.colorTheme, required this.onTap, this.textButton});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      height: 50.h,
      width: 150.w,
      color: colorTheme.blueButton,
      textButton: textButton,
      margin: EdgeInsets.only(right: 20.w),
      textStyle: const TextStyle(color: Colors.white),
      fontSize: 16.sp,
      onTap: onTap,
    );
  }
}
