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
            labelText: context.tr("card_number"),
            hintText: "XXXX XXXX XXXX XXXX",
            errorText: context.tr("card_number_error"),
            inputFormatters: [CardNumberInputFormatter()],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: PaymentTextFieldWidget(
                  controller: expiryMonthController,
                  labelText: context.tr("expiry_month"),
                  hintText: "MM",
                  errorText: context.tr("expiry_month_error"),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: PaymentTextFieldWidget(
                  controller: expiryYearController,
                  labelText: context.tr("expiry_year"),
                  hintText: "YY",
                  errorText: context.tr("expiry_year_error"),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          PaymentTextFieldWidget(
            controller: cvcController,
            labelText: context.tr("cvc"),
            hintText: "CVC",
            errorText: context.tr("cvc_error"),
          ),
        ],
      ),
    );
  }
}
