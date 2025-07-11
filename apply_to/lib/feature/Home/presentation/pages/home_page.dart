import 'package:apply_to/core/widgets/bottom_Nav_widget.dart';
import 'package:apply_to/feature/Home/data/slider_pic.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/customize_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Text("Companys.".tr(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 20.w,
            ),),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavWidget(currentPage:'home' ,) , 
    );
  }
}
