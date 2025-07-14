import 'package:apply_to/feature/Applications/presentation/pages/applications_page.dart';
import 'package:apply_to/feature/Home/presentation/home_page.dart';
import 'package:apply_to/feature/Profile/presentation/pages/Profile_page.dart';
import 'package:apply_to/feature/Settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavWidget extends StatelessWidget {
  final String currentPage; 

  const BottomNavWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final activeColor = Theme.of(context).colorScheme.onBackground;
    final inactiveColor = Theme.of(context).colorScheme.background;

    return Container(
      color:  Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.all(8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.settings),
            color: currentPage == 'settings' ? activeColor : inactiveColor,
            onPressed: () {
              if (currentPage != 'settings') {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SettingsPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            color: currentPage == 'home' ? activeColor : inactiveColor,
            onPressed: () {
              if (currentPage != 'home') {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: currentPage == 'profile' ? activeColor : inactiveColor,
            onPressed: () {
              if (currentPage != 'profile') {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProfilePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.file_copy),
            color: currentPage == 'applications' ? activeColor : inactiveColor,
            onPressed: () {
              if (currentPage != 'applications') {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ApplicationsPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
