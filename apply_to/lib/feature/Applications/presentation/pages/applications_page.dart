import 'package:apply_to/core/widgets/bottom_Nav_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widgets/customize_app_bar.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizeAppBar(text: "applications".tr()),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
      ),
      bottomNavigationBar: BottomNavWidget(currentPage:'applications' ,) , 
    );
  }
}
