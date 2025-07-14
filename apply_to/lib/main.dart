import 'package:apply_to/core/theme/app_theme.dart';
import 'package:apply_to/cubit/main_cubit.dart';
import 'package:apply_to/cubit/main_state.dart';
import 'package:apply_to/feature/Home/presentation/home_page.dart';
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
  print("rebuild ==================== void");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'lib/core/utils/lang',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("rebuild ==================== my app");
    return ScreenUtilInit(
      designSize: const Size(448, 997),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocListener<MainCubit, MainState>(
          listener: (context, state) {
            final newLocale = state.language == AppLanguage.ar
                ? Locale('ar')
                : Locale('en');
            if (context.locale != newLocale) {
              context.setLocale(newLocale);
            }
          },
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              print("rebuild ==================== material app");
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale, // نخلي EasyLocalization هو المتحكم هنا
                title: 'Flutter Demo',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: state.themeMode == AppThemeMode.light
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: const HomePage(),
              );
            },
          ),
        );
      },
    );
  }
}
