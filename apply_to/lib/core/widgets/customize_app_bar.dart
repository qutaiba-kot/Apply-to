import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const CustomizeAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20.w,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  // هذا يجب إضافته لأن Scaffold يتطلبه
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
