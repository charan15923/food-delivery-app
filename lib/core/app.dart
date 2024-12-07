import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/home/presentation/bloc/cart/cart_bloc.dart';
import '../features/home/presentation/bloc/home/home_bloc.dart';
import '../service_locator.dart';
import 'router/app_navigation.dart';
import 'theme/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>(),
        ),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Delivery App',
              debugShowCheckedModeBanner: false,
              routerConfig: AppNavigation.router,
              theme: AppTheme.lightTheme.copyWith(
                cupertinoOverrideTheme:
                    const CupertinoThemeData(applyThemeToAll: true),
              ),
            );
          },
        ),
      ),
    );
  }
}
