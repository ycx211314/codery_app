import 'dart:io';

// import 'package:admob_flutter/admob_flutter.dart';
import 'package:codery/common/config/global.dart';
import 'package:codery/common/themes/codery_theme.dart';
import 'package:codery/data/provider/auth_provider.dart';
// import 'package:codery/firebase_options.dart';
import 'package:codery/generated/l10n.dart';
import 'package:codery/routes/app_router.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> init() async {
  // await Global.init();

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await Admob.requestTrackingAuthorization();
  // Admob.initialize();
  // Admob.initialize(testDeviceIds: ['DB204A68-64E6-450A-920E-ED6E1AF6A3DF']);

  //锁定竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]); //DeviceOrientation有四个实例，代表四个方向。结合英文意思，这是设置首选方向

  //android 状态栏设置为透明的沉浸
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Config.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // MaterialApp.router(routerConfig: _appRouter.config())
          return MaterialApp.router(
            title: 'Codery APP',
            // home: const ApplicationPage(),
            routerConfig: _appRouter.config(),
            theme: coderyTheme,
            locale: Locale(Intl.getCurrentLocale()),
            debugShowCheckedModeBanner: true,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        });
  }
}
