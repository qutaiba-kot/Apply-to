import 'package:apply_to/core/widgets/bottom_Nav_widget.dart';
import 'package:apply_to/core/widgets/customize_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizeAppBar(text: "profile".tr()),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
      ),
      bottomNavigationBar: BottomNavWidget(currentPage:'profile' ,) , 
    );
  }
}
