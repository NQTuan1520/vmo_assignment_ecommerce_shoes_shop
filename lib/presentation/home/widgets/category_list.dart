import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/animation/fade_animation.dart';

import '../bloc/categories/categories_bloc.dart';
import '../bloc/products/products_bloc.dart';

class CategoryList extends StatefulWidget {
  final List<CategoryDataEntity> categories;
  final CategoryDataEntity? selectedCategory;

  const CategoryList({super.key, required this.categories, this.selectedCategory});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryDataEntity? selectedCategory;
  final colorTheme = MyColorTheme();

  @override
  void initState() {
    selectedCategory = widget.selectedCategory;
    super.initState();
  }

  @override
  void didUpdateWidget(CategoryList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategory != oldWidget.selectedCategory) {
      setState(() {
        selectedCategory = widget.selectedCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length,
          itemBuilder: (context, index) {
            final category = widget.categories[index];

            final String imageUrl = category.assets?.isNotEmpty == true
                ? category.assets![0].url ?? 'https://example.com/default.jpg'
                : 'https://example.com/default.jpg';

            final bool isSelected = selectedCategory?.id == category.id;

            return FadeAnimation(
              1.2,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    context.read<CategoriesBloc>().add(SelectCategory(category));
                    context.read<ProductsBloc>().add(FilterProductsByCategory(category));
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isSelected ? colorTheme.blueBottomBar : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imageUrl),
                          radius: 28,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: isSelected ? null : 0,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: isSelected ? 1.0 : 0.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  category.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
