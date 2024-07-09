import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../managers/utils/login_ui_helpers.dart';
import '../../common/animation/fade_animation.dart';
import '../../product_detail/product_detail_args.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductDataEntity> products;

  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _buildSection(
            context,
            "All_Products".tr(),
            products,
            (product) => _buildProductCard(context, product),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<ProductDataEntity> products,
    Widget Function(ProductDataEntity product) itemBuilder,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 20.h, left: 18.w),
      height: 310.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: GestureDetector(
                  onTap: () {
                    LoginUIHelpers.checkLoginStatusAndPrompt(context, '/products', null);
                  },
                  child: Text(
                    "See_all".tr(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return itemBuilder(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    ProductDataEntity product,
  ) {
    final MyColorTheme colorTheme = MyColorTheme();
    return FadeAnimation(
      0.3,
      GestureDetector(
        onTap: () {
          LoginUIHelpers.checkLoginStatusAndPrompt(
            context,
            '/product_detail',
            ProductDetailArgs(product: product),
          );
        },
        child: Container(
          width: 170.w,
          margin: EdgeInsets.only(right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(width: 1.5, color: Colors.grey.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  product.image?.url ?? '',
                  height: 100.h,
                  width: 190.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.categories?.first.name ?? '',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: colorTheme.blueButton,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.name ?? '',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 8.h),
                    child: Text(
                      "\$${product.price?.formatted ?? ''}",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  FloatingActionButton(
                    onPressed: () {
                      LoginUIHelpers.checkLoginStatusAndPrompt(
                        context,
                        '/product_detail',
                        ProductDetailArgs(product: product, showBottomSheet: true),
                      );
                    },
                    heroTag: null,
                    mini: true,
                    backgroundColor: colorTheme.blueBottomBar,
                    child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
