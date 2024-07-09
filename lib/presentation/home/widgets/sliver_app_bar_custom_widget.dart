import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../generated/assets.dart';
import '../../common/animation/fade_animation.dart';
import '../../settings/bloc/theme/theme_bloc.dart';

class SliverAppBarCustomWidget extends StatelessWidget {
  final bool isScrolled;
  final ZoomDrawerController zoomDrawerController;
  final void Function(BuildContext) checkLoginStatusAndPrompt;
  const SliverAppBarCustomWidget(
      {super.key,
      required this.isScrolled,
      required this.zoomDrawerController,
      required this.checkLoginStatusAndPrompt});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: AnimatedOpacity(
        opacity: isScrolled ? 1.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isScrolled ? Colors.white : Colors.transparent,
          ),
          child: IconButton(
            icon: Icon(Icons.menu, size: 32.sp, color: isScrolled ? Colors.black : Colors.white),
            onPressed: () {
              zoomDrawerController.toggle?.call();
            },
          ),
        ),
      ),
      actions: [
        AnimatedOpacity(
          opacity: isScrolled ? 1.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            margin: EdgeInsets.only(left: 8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isScrolled ? Colors.white : Colors.transparent,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag, size: 32.sp, color: isScrolled ? Colors.black : Colors.white),
              onPressed: () {
                checkLoginStatusAndPrompt(context);
              },
            ),
          ),
        ),
      ],
      title: AnimatedOpacity(
        opacity: isScrolled ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Text("Shoes_Shop".tr(), style: TextStyle(fontSize: 20.sp)),
      ),
      centerTitle: true,
      expandedHeight: 280.0.h,
      elevation: 0,
      pinned: true,
      floating: false,
      stretch: true,
      flexibleSpace: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double top = constraints.biggest.height;

              double opacity = (top - kToolbarHeight) / (300 - kToolbarHeight);
              return FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: isScrolled ? 16.h : 80.h,
                ),
                title: AnimatedOpacity(
                  opacity: isScrolled ? 1.0 : opacity.clamp(0.0, 1.0),
                  duration: const Duration(milliseconds: 300),
                  child: FadeAnimation(
                    1,
                    Text(
                      "Find_Your_Shoes_Collections".tr(),
                      style: TextStyle(
                        fontSize: isScrolled ? 20.sp : 28.sp,
                      ),
                    ),
                  ),
                ),
                background: state.isDarkMode
                    ? Image.asset(
                        Assets.imagesBackgroundDark,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        Assets.imagesBackground,
                        fit: BoxFit.cover,
                      ),
              );
            },
          );
        },
      ),
      bottom: AppBar(
        toolbarHeight: 70.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Expanded(
              child: FadeAnimation(
                1.4,
                SizedBox(
                  height: 50.h,
                  child: TextField(
                    readOnly: true,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.black, size: 24.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Looking_for_shoes".tr(),
                      hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/search');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
