import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/generated/assets.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/bloc/onboarding_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/widgets/dot_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/widgets/onboarding_custom_button_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/widgets/page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onBoarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  final MyColorTheme colorTheme = MyColorTheme();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                bottom: 250.h,
                left: 0,
                right: 0,
                top: 0,
                child: SvgPicture.asset(
                  Assets.imagesNike,
                  colorFilter: ColorFilter.mode(Colors.grey[200]!, BlendMode.srcIn),
                ),
              ),
              Positioned(
                bottom: 220.h,
                left: 0,
                right: 0,
                top: 0,
                child: Image.asset(Assets.imagesOnboardingBubbles),
              ),
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  context.read<OnboardingBloc>().add(UpdateCurrentPage(index));
                },
                children: [
                  PageWidget(
                    imageUrl: Assets.imagesOnboarding1,
                    title: context.tr("title_onboarding_1"),
                    description: context.tr("description_onboarding_1"),
                  ),
                  PageWidget(
                    imageUrl: Assets.imagesOnboarding2,
                    title: context.tr("title_onboarding_2"),
                    description: context.tr("description_onboarding_2"),
                  ),
                  PageWidget(
                    imageUrl: Assets.imagesOnboarding3,
                    title: context.tr("title_onboarding_3"),
                    description: context.tr("description_onboarding_3"),
                  ),
                ],
              ),
              Positioned(
                top: 50.h,
                right: 10.w,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/log_in');
                  },
                  child: Text(
                    context.tr("Skip"),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              Positioned(
                bottom: 35.h,
                left: 10.w,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(3, (index) {
                        return DotWidget(
                          currentPage: state.currentPage,
                          index: index,
                          context: context,
                          colorTheme: colorTheme,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 5.w,
                bottom: 20.h,
                child: Row(
                  children: [
                    state.currentPage == 0
                        ? OnboardingCustomButtonWidget(
                            colorTheme: colorTheme,
                            textButton: context.tr('next'),
                            onTap: () {
                              _controller.nextPage(duration: const Duration(milliseconds: 3), curve: Curves.elasticIn);
                            },
                          )
                        : Container(),
                    state.currentPage == 1
                        ? OnboardingCustomButtonWidget(
                            colorTheme: colorTheme,
                            textButton: context.tr('next'),
                            onTap: () {
                              _controller.nextPage(duration: const Duration(milliseconds: 3), curve: Curves.elasticIn);
                            },
                          )
                        : Container(),
                    state.currentPage == 2
                        ? OnboardingCustomButtonWidget(
                            colorTheme: colorTheme,
                            textButton: context.tr('get_started'),
                            onTap: () {
                              Navigator.pushNamed(context, '/log_in');
                            },
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
