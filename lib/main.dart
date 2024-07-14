import 'dart:io';
import 'dart:ui';

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
import 'package:tencent_cloud_chat/components/tencent_cloud_chat_components_utils.dart';
import 'package:tencent_cloud_chat/models/tencent_cloud_chat_callbacks.dart';
import 'package:tencent_cloud_chat/models/tencent_cloud_chat_models.dart';
import 'package:tencent_cloud_chat/tencent_cloud_chat.dart';
import 'package:tencent_cloud_chat/utils/tencent_cloud_chat_code_info.dart';
import 'package:tencent_cloud_chat_conversation/tencent_cloud_chat_conversation.dart';
import 'package:tencent_cloud_chat_message/tencent_cloud_chat_message.dart';

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

  await TencentImSDKPlugin.v2TIMManager.initSDK(
    sdkAppID:
        1600044793, // Replace 0 with the SDKAppID of your IM application when integrating
    loglevel: LogLevelEnum.V2TIM_LOG_DEBUG, // Log
    listener: V2TimSDKListener(),
  );

  await TencentCloudChat.controller.initUIKit(
    config: const TencentCloudChatConfig(),

    /// [Optional]: The global configurations that affecting the whole Chat UIKit, including user-related configs, theme-related configs, etc.
    options: const TencentCloudChatInitOptions(
      sdkAppID: 1600044793,

      /// [Required]: The SDKAppID of your Tencent Cloud Chat application
      userID: "0001",

      /// [Required]: The userID of the logged-in user
      userSig:
          "eJwtzL0OgjAYheF76aohH4XaQuKkkyhD-Ytja6v5UExT0YjGe7cC43lO8n7IZrmOntaTnNAIyLjbaOytwRN2DADx4HdzUc6hIXk8CZymPEv6x74cehucMUbD1WuD9d84BcESCnSo4DlkK5C*3CqtR0eqQc2rg5LWSFG8d7UoOV4fs322aNu4WE3J9wdv7zAH",

      /// [Required]: The userSig of the logged-in user
    ),

    components: const TencentCloudChatInitComponentsRelated(
      /// [Required]: The modular UI components related settings, taking effects on a global scale.
      usedComponentsRegister: [
        /// [Required]: List of registration functions for the components used in the Chat UIKit.
        TencentCloudChatConversationManager.register,
        TencentCloudChatMessageManager.register,
        // TencentCloudChatMessageManager.register,
        /// ......
        /// The above registers are examples. In this field, pass in the register of each sub Modular UI Package.
        /// After installing each sub Modular UI Package, you need to declare it here before you can use it.
      ],
      componentConfigs: TencentCloudChatComponentConfigs(

          /// [Optional]: Provide your custom configurations for each UI modular component here. These builders will be applied globally.
          ),
      componentBuilders: TencentCloudChatComponentBuilders(

          /// [Optional]: Provide your custom UI builders for each UI modular component here. These builders will be applied globally.
          ),
      componentEventHandlers: TencentCloudChatComponentEventHandlers(

          /// [Optional]: Provide your custom event handlers for UI component-related events here. These builders will be applied globally.
          ),
    ),

    /// **[Critical]**: It's strongly advised to incorporate the following callback listeners for effectively managing SDK events, SDK API errors and specific UIKit events that demand user attention.
    /// For detailed usage, please refer to the 'Introducing Callbacks for UIKit' section at the end of this README.
    callbacks: TencentCloudChatCallbacks(
      onTencentCloudChatSDKEvent: V2TimSDKListener(),

      /// [Optional]: Handles SDK events, such as `onKickedOffline` and `onUserSigExpired`, etc.
      onTencentCloudChatSDKFailedCallback: (apiName, code, desc) {},

      /// [Optional]: Handles SDK API errors.
      onTencentCloudChatUIKitUserNotificationEvent:
          (TencentCloudChatComponentsEnum component,
              TencentCloudChatUserNotificationEvent event) {},

      /// [Optional]: Handles specific UIKit events that require user attention on a global scale.
    ),

    plugins: [],

    /// [Optional]: Used plugins, such as tencent_cloud_chat_robot, etc. For specific usage, please refer to the README of each plugin.
  );
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
