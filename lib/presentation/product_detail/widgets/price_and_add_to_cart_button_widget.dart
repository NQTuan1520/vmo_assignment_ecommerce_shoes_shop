import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../common/widgets/custom_button_widget.dart';

class PriceAndAddToCartButtonWidget extends StatelessWidget {
  final ProductDataEntity product;
  final MyColorTheme colorTheme;
  final Function() onTap;

  const PriceAndAddToCartButtonWidget(
      {super.key, required this.product, required this.colorTheme, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        border: const Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
              SizedBox(height: 8.h),
              Text(
                "\$${product.price?.formatted ?? ''}",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomButtonWidget(
            height: 50.h,
            width: 180.w,
            color: colorTheme.blueButton,
            textButton: "Buy_Product".tr(),
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            fontSize: 18.sp,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
