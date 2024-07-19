import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../common/widgets/custom_back_button.dart';
import '../../favourite/bloc/favourite_bloc.dart';

class AppbarCustomWidget extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final ProductDataEntity product;

  const AppbarCustomWidget({super.key, required this.context, required this.product});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(product.name ?? ''),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const CustomBackButton(),
      ),
      actions: [
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            final isFavorite = state.favourites.any((item) => item.id == product.id);
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.red[200],
                size: 30.sp,
              ),
              onPressed: () {
                final event = isFavorite ? RemoveFavoriteEvent(product.id ?? '') : AddFavoriteEvent(product);
                context.read<FavouriteBloc>().add(event);
              },
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
