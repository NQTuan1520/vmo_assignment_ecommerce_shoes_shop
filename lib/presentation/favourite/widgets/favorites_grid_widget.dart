import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import 'favorite_item_widget.dart';

class FavoritesGridWidget extends StatelessWidget {
  final List<ProductDataEntity> favorites;

  const FavoritesGridWidget({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites[index];
        return FavoriteItemWidget(product: product);
      },
    );
  }
}
