// Using a state management solution (example with Provider)
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class IMProvider with ChangeNotifier {
  CoreServicesImpl coreInstance = TIMUIKitCore.getInstance();
  bool initFinished = false;
  bool isLoggedIn = false;

  Future<void> init() async {
    initFinished = await coreInstance.init(
            sdkAppID:
                1600044793, // Replace 0 with the SDKAppID of your IM application when integrating
            // language: LanguageEnum.en, // 界面语言配置，若不配置，则跟随系统语言
            loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
            onTUIKitCallbackListener: (TIMCallback
                callbackValue) {}, // [建议配置，详见此部分](https://cloud.tencent.com/document/product/269/70746#callback)
            listener: V2TimSDKListener()) ??
        false;
    notifyListeners();
  }

  Future<void> loginIM(String userID, String userSig) async {
    V2TimCallback v2timCallback =
        await coreInstance.login(userID: userID, userSig: userSig);
    print(v2timCallback);
    isLoggedIn = true;
    notifyListeners();
  }
}
