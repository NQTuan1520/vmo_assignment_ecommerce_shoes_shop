import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../managers/enum/enum.dart';
import '../../common/widgets/shimmer_widget.dart';
import '../bloc/variants/variants_bloc.dart';

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantsBloc, VariantsState>(
      builder: (context, state) {
        if (state.categoriesStatus == Status.loading && (state.categories?.isEmpty ?? true)) {
          return ShimmerWidget(width: 200.w, height: 40.h);
        } else if (state.categoriesStatus == Status.success) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                ...?state.categories?.map((category) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        children: [
                          _buildCategoryItem(category.assets?.first.url ?? ''),
                          SizedBox(width: 8.w),
                          Text(
                            "${category.name ?? ''} ${"Store".tr()}",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        } else if (state.categoriesStatus == Status.failure) {
          return Center(child: Text(state.errorMessage ?? "Error_occurred".tr()));
        } else {
          return Center(child: Text("No_categories_available".tr()));
        }
      },
    );
  }

  Widget _buildCategoryItem(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 70.h,
          width: 70.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
