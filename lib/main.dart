import 'dart:io';
import 'dart:ui';

// import 'package:admob_flutter/admob_flutter.dart';
import 'package:codery/common/config/global.dart';
import 'package:codery/common/themes/codery_theme.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/firebase_options.dart';
import 'package:codery/generated/l10n.dart';
import 'package:codery/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/data_services/core/core_services_implements.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

void main() {
  init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthorityProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> init() async {
  // await Global.init();

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
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

  final CoreServicesImpl coreInstance = TIMUIKitCore.getInstance();
  await coreInstance
      .init(
          sdkAppID:
              1600044793, // Replace 0 with the SDKAppID of your IM application when integrating
          // language: LanguageEnum.en, // 界面语言配置，若不配置，则跟随系统语言
          loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
          onTUIKitCallbackListener: (TIMCallback
              callbackValue) {}, // [建议配置，详见此部分](https://cloud.tencent.com/document/product/269/70746#callback)
          listener: V2TimSDKListener())
      .then((value) async {
    await coreInstance.login(
        userID: "0002",
        userSig:
            "eJwtzFELgjAYheH-sttCvm0umdBVBIUFYRO7FbfsI5JlprLov7fUy-MceD9EHc5BZxoSExYAWY4btalbvOLIAMBmf*l7YS1qEtOV5zCMJJ8eM1hsjHchBPPXpC0*-hYxCpxyGc0VrHx2yPobuGcGx1OeuG6hVG-dPn03ZV5K2BVFndDysrFptV2T7w*MdTDW-S9szKDzfKckxxKjOxVaoFAKVrMFA_");
  });
  // coreInstance.login(
  //     userID: "0001",
  //     userSig:
  //         "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwgYGBoZQ8eKU7MSCgswUJStDM6CwiYm5pTFEJrWiILMoFShuampqBJSCiJZk5oLEzI0MDYwsLU1MoaZkpgONdc4KzQ4xyXTzzMzPd8mIjNEPqqpMdLYwMnfO9AnxyM-S9szKDzfKckxxKjOxVaoFAKVrMFA_");

  // await coreInstance.login(
  //     userID: "0002",
  //     userSig:
  //         "eJwtzFELgjAYheH-sttCvm0umdBVBIUFYRO7FbfsI5JlprLov7fUy-MceD9EHc5BZxoSExYAWY4btalbvOLIAMBmf*l7YS1qEtOV5zCMJJ8eM1hsjHchBPPXpC0*-hYxCpxyGc0VrHx2yPobuGcGx1OeuG6hVG-dPn03ZV5K2BVFndDysrFptV2T7w*MdTDW-S9szKDzfKckxxKjOxVaoFAKVrMFA_");
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
          return MaterialApp.router(
            title: 'Codery APP',
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
