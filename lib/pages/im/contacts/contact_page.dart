import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

@RoutePage()
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final CoreServicesImpl coreInstance = TIMUIKitCore.getInstance();
    // coreInstance.init(
    //     sdkAppID:
    //         1600044793, // Replace 0 with the SDKAppID of your IM application when integrating
    //     // language: LanguageEnum.en, // 界面语言配置，若不配置，则跟随系统语言
    //     loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
    //     onTUIKitCallbackListener: (TIMCallback
    //         callbackValue) {}, // [建议配置，详见此部分](https://cloud.tencent.com/document/product/269/70746#callback)
    //     listener: V2TimSDKListener());

    // coreInstance.login(
    //     userID: "0001",
    //     userSig:
    //         "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwgYGBoZQ8eKU7MSCgswUJStDM6CwiYm5pTFEJrWiILMoFShuampqBJSCiJZk5oLEzI0MDYwsLU1MoaZkpgONdc4KzQ4xyXTzzMzPd8mIjNEPqqpMdLYwMnfO9AnxyM-S9szKDzfKckxxKjOxVaoFAKVrMFA_");

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Messages",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TIMUIKitContact(
          emptyBuilder: (context) => const Center(
            child: Text("无联系人"),
          ),
        ));
  }
}
