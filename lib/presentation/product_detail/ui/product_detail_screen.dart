import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/toast_utils.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/appbar_custom_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/divider_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/price_and_add_to_cart_button_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/product_image_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/product_info_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/widgets/variant_options_widget.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../managers/colors/colors.dart';
import '../../common/widgets/custom_button_widget.dart';
import '../bloc/variants/variants_bloc.dart';
import '../widgets/store_info_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDataEntity product;
  final bool showBottomSheet;

  const ProductDetailScreen({
    super.key,
    required this.product,
    this.showBottomSheet = false,
  });

  static const String routeName = '/product_detail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final MyColorTheme _colorTheme = MyColorTheme();

  @override
  void initState() {
    super.initState();
    context.read<VariantsBloc>().add(ResetProductState());
    context.read<VariantsBloc>().add(FetchVariants(widget.product.id ?? ''));
    context.read<VariantsBloc>().add(FetchCategories(widget.product));

    if (widget.showBottomSheet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(
          const Duration(milliseconds: 2000),
          _showAddToCartBottomSheet,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustomWidget(
        context: context,
        product: widget.product,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageWidget(product: widget.product),
                  SizedBox(height: 16.h),
                  ProductInfoWidget(
                    context: context,
                    product: widget.product,
                    colorTheme: _colorTheme,
                  ),
                  SizedBox(height: 16.h),
                  const DividerWidget(),
                  const StoreInfoWidget(),
                  const DividerWidget(),
                  VariantOptionsWidget(product: widget.product),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          PriceAndAddToCartButtonWidget(
            product: widget.product,
            colorTheme: _colorTheme,
            onTap: _showAddToCartBottomSheet,
          ),
        ],
      ),
    );
  }

  void _showAddToCartBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BlocConsumer<VariantsBloc, VariantsState>(
          listenWhen: (previous, current) =>
              previous.status != current.status && previous.isAddingToCart != current.isAddingToCart,
          listener: (context, state) {
            if (state.status == Status.success && !state.isAddingToCart) {
              ToastUtils.showSuccessToast(message: "Item_added_to_cart_successfully".tr());
              Navigator.of(context).pop();
            } else if (state.status == Status.failure && !state.isAddingToCart) {
              ToastUtils.showErrorToast(message: state.errorMessage ?? "Error_adding_to_cart".tr());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select_Size_and_Color".tr(),
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.h),
                  VariantOptionsWidget(product: widget.product),
                  state.status != Status.loading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity".tr(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<VariantsBloc>().add(DecreaseQuantity());
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                BlocBuilder<VariantsBloc, VariantsState>(
                                  builder: (context, state) {
                                    return Text(state.quantity.toString(), style: const TextStyle(fontSize: 18.0));
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<VariantsBloc>().add(IncreaseQuantity());
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  CustomButtonWidget(
                    height: 50.h,
                    width: double.infinity,
                    color: state.status == Status.loading && state.isAssetLoading == false
                        ? Colors.grey
                        : _colorTheme.blueButton,
                    textButton:
                        state.status == Status.loading && state.isAssetLoading == false ? "Adding..." : "Add to Cart",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    fontSize: 18.sp,
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    onTap: state.status == Status.loading
                        ? null
                        : () {
                            bool hasSizeSelected = false;
                            bool hasColorSelected = false;

                            state.variants?.forEach((variantGroup) {
                              final variantOption = variantOptionMap[variantGroup.name?.toLowerCase()];
                              if (variantOption == VariantOption.size) {
                                hasSizeSelected = state.selectedOptions.containsKey(variantGroup.id);
                              } else if (variantOption == VariantOption.color) {
                                hasColorSelected = state.selectedOptions.containsKey(variantGroup.id);
                              }
                            });

                            if (!hasSizeSelected || !hasColorSelected) {
                              ToastUtils.showSuccessToast(message: "Please_select_size_and_color".tr());
                            } else {
                              context.read<VariantsBloc>().add(AddToCart(
                                    productId: widget.product.id ?? '',
                                    quantity: state.quantity,
                                    selectedOptions: state.selectedOptions,
                                  ));
                            }
                          },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
