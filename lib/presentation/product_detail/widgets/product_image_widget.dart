import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_data_entity.dart';

import '../../../managers/enum/enum.dart';
import '../../common/widgets/shimmer_widget.dart';
import '../bloc/variants/variants_bloc.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductDataEntity product;

  const ProductImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BlocBuilder<VariantsBloc, VariantsState>(
        builder: (context, state) {
          if (state.status == Status.loading && !state.isCartLoading) {
            return ShimmerWidget(height: 250.h, width: double.infinity);
          } else {
            return CachedNetworkImage(
              imageUrl: state.selectedImageUrl ?? product.image?.url ?? '',
              height: 250.h,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }
        },
      ),
    );
  }
}
