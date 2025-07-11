import 'package:apply_to/core/widgets/bottom_Nav_widget.dart';
import 'package:apply_to/core/widgets/customize_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubit/main_cubit.dart';
import '../../../../cubit/main_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
 @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomizeAppBar(text: "setting".tr()),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          ListTile(
            horizontalTitleGap: 01.w,
            trailing: IconButton(
              onPressed: () {
                context.read<MainCubit>().toggleLanguage();
              },
              icon: Icon(Icons.language),
            ),
            leading: Text(
              "Languge".tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 17,
              ),
            ),
          ),
          ListTile(
            horizontalTitleGap: 01.w,
            trailing: IconButton(
              onPressed: () {
                context.read<MainCubit>().toggleTheme();
              },
              icon: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  if(state.themeMode == AppThemeMode.light){return Icon(Icons.light_mode);}
                  else return Icon(Icons.dark_mode);
                },
              ),
            ),
            leading: Text(
              "mode".tr(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavWidget(currentPage: 'settings'),
    );
  }
}
