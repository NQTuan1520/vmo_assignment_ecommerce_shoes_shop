import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/widget/payment_text_field_widget.dart';

import 'card_input_formartter.dart';

class PaymentCardWidget extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryMonthController;
  final TextEditingController expiryYearController;
  final TextEditingController cvcController;
  final MyColorTheme colorTheme;

  const PaymentCardWidget({
    super.key,
    required this.cardNumberController,
    required this.expiryMonthController,
    required this.expiryYearController,
    required this.cvcController,
    required this.colorTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, colorTheme.blueButton.withOpacity(0.8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.r,
            spreadRadius: 5.r,
          ),
        ],
      ),
      child: Column(
        children: [
          PaymentTextFieldWidget(
            controller: cardNumberController,
            labelText: "card_number".tr(),
            hintText: "XXXX XXXX XXXX XXXX",
            errorText: "card_number_error".tr(),
            inputFormatters: [CardNumberInputFormatter()],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: PaymentTextFieldWidget(
                  controller: expiryMonthController,
                  labelText: "expiry_month".tr(),
                  hintText: "MM",
                  errorText: "expiry_month_error".tr(),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: PaymentTextFieldWidget(
                  controller: expiryYearController,
                  labelText: "expiry_year".tr(),
                  hintText: "YY",
                  errorText: "expiry_year_error".tr(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          PaymentTextFieldWidget(
            controller: cvcController,
            labelText: "cvc".tr(),
            hintText: "CVC",
            errorText: "cvc_error".tr(),
          ),
        ],
      ),
    );
  }
}
