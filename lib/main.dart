import 'package:codery/common/config/global.dart';
import 'package:codery/common/themes/codery_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:codery/pages/application/application_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Config.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Codery APP',
            home: const ApplicationPage(),
            theme: coderyTheme,
            // routes: staticRoutes,
            debugShowCheckedModeBanner: true,
          );
        });
  }
}
