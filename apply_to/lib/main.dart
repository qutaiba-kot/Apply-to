import 'package:apply_to/core/theme/app_theme.dart';
import 'package:apply_to/cubit/main_cubit.dart';
import 'package:apply_to/cubit/main_state.dart';
import 'package:apply_to/feature/Home/presentation/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(
    BlocProvider(
      create: (_) => MainCubit(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'lib/core/utils/lang',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listenWhen: (previous, current) => previous.language != current.language,
      listener: (context, state) {
        if (state.language == AppLanguage.ar &&
            context.locale.languageCode != 'ar') {
          context.setLocale(const Locale('ar'));
        } else if (state.language == AppLanguage.en &&
            context.locale.languageCode != 'en') {
          context.setLocale(const Locale('en'));
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(448, 997),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: 'Flutter Demo',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state.themeMode == AppThemeMode.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
