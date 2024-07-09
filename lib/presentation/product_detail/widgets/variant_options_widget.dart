import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../managers/enum/enum.dart';
import '../../common/widgets/shimmer_widget.dart';
import '../bloc/variants/variants_bloc.dart';

class VariantOptionsWidget extends StatelessWidget {
  final ProductDataEntity product;

  const VariantOptionsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final MyColorTheme colorTheme = MyColorTheme();

    return BlocBuilder<VariantsBloc, VariantsState>(
      builder: (context, state) {
        if (state.status == Status.loading && !state.isAssetLoading && !state.isCartLoading) {
          return ShimmerWidget(width: double.infinity, height: 40.h);
        } else if (state.status == Status.success || state.isAssetLoading) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 16.h, top: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.variants?.map((variantGroup) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          variantGroup.name ?? '',
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        Wrap(
                          spacing: 8.r,
                          children: variantGroup.options!.map((option) {
                            final isSelected = state.selectedOptions[variantGroup.id] == option.id;
                            return GestureDetector(
                              onTap: () {
                                _onOptionSelected(context, variantGroup.id ?? '', option.id ?? '');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                                margin: EdgeInsets.only(bottom: 8.h),
                                decoration: BoxDecoration(
                                  color: isSelected ? colorTheme.blueButton : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: isSelected ? colorTheme.blueButton : Colors.grey,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            blurRadius: 10.0,
                                            offset: const Offset(0, 3),
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Text(
                                  option.name ?? '',
                                  style: TextStyle(fontSize: 14.sp, color: isSelected ? Colors.white : Colors.black),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    );
                  }).toList() ??
                  [],
            ),
          );
        } else if (state.status == Status.failure) {
          return Center(child: Text(state.errorMessage ?? "Error_occurred".tr()));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _onOptionSelected(BuildContext context, String variantGroupId, String optionId) {
    context.read<VariantsBloc>().add(SelectOption(variantGroupId, optionId));
    if (optionId.isNotEmpty) {
      final selectedOption = context
          .read<VariantsBloc>()
          .state
          .variants
          ?.firstWhere((variantGroup) => variantGroup.id == variantGroupId)
          .options
          ?.firstWhere((option) => option.id == optionId);

      final selectedAssetId = selectedOption?.assets?.isNotEmpty == true ? selectedOption?.assets?.first : null;

      if (selectedAssetId != null) {
        _onColorSelected(context, product.id ?? '', variantGroupId, optionId, selectedAssetId);
      }
    }
  }

  void _onColorSelected(
      BuildContext context, String productId, String variantGroupId, String optionId, String selectedAssetId) {
    context.read<VariantsBloc>().add(SelectColor(
          productId: product.id ?? '',
          variantGroupId: variantGroupId,
          optionId: optionId,
          assetId: selectedAssetId,
        ));
  }
}
