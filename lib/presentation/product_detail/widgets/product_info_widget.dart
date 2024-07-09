import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../bloc/product_detail/product_detail_bloc.dart';

class ProductInfoWidget extends StatelessWidget {
  final BuildContext context;
  final ProductDataEntity product;
  final MyColorTheme colorTheme;

  const ProductInfoWidget({
    super.key,
    required this.context,
    required this.product,
    required this.colorTheme,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BEST_SELLER".tr(),
                style: TextStyle(fontSize: 14.sp, color: Colors.blue),
              ),
              SizedBox(height: 8.h),
              Text(
                product.name ?? '',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                "\$${product.price?.formatted ?? ''}",
                style: TextStyle(fontSize: 28.sp, color: Colors.green),
              ),
              SizedBox(height: 16.h),
              Text(
                state.isDescriptionExpanded ? product.cleanDescription : _truncateDescription(product.cleanDescription),
                style: TextStyle(fontSize: 18.sp),
              ),
              GestureDetector(
                onTap: () {
                  context.read<ProductDetailBloc>().add(ToggleDescriptionExpanded());
                },
                child: Text(
                  state.isDescriptionExpanded ? "Show_less".tr() : "Show_more".tr(),
                  style: TextStyle(color: colorTheme.blueButton, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _truncateDescription(String description) {
    if (description.length > 90) {
      return '${description.substring(0, 90)}...';
    }
    return description;
  }
}
