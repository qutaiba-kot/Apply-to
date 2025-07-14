import 'package:apply_to/core/widgets/bottom_Nav_widget.dart';
import 'package:apply_to/feature/Home/data/slider_pic.dart';
import 'package:apply_to/feature/Home/logic/cubit/home_cubit.dart';
import 'package:apply_to/feature/Home/logic/cubit/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/widgets/customize_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..imageStatus(),
      child: Scaffold(
        appBar: CustomizeAppBar(text: "home".tr()),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(height: 100.h),
            Text(
              "Welcom Qutaiba on Apply to APP".tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20.w,
              ),
            ),
            SizedBox(height: 150.h),
            Text(
              "Companys.".tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20.w,
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Container(
                  child: Skeletonizer(
                    enabled: state.isLoading,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: imageSliders.isNotEmpty
                          ? imageSliders
                          : List.generate(
                              3,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: double.infinity,
                                height: 200,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavWidget(currentPage: 'home'),
      ),
    );
  }
}
