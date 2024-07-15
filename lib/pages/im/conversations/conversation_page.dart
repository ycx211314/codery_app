import 'package:auto_route/auto_route.dart';
import 'package:codery/pages/im/chats/Chat_page.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

@RoutePage()
class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final CoreServicesImpl coreInstance = TIMUIKitCore.getInstance();
  @override
  void initState() {
    coreInstance
        .init(
            sdkAppID:
                1600044793, // Replace 0 with the SDKAppID of your IM application when integrating
            // language: LanguageEnum.en, // 界面语言配置，若不配置，则跟随系统语言
            loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
            onTUIKitCallbackListener: (TIMCallback
                callbackValue) {}, // [建议配置，详见此部分](https://cloud.tencent.com/document/product/269/70746#callback)
            listener: V2TimSDKListener())
        .then((value) {
      print(value);
      coreInstance.login(
          userID: "0001",
          userSig:
              "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwgYGBoZQ8eKU7MSCgswUJStDM6CwiYm5pTFEJrWiILMoFShuampqBJSCiJZk5oLEzI0MDYwsLU1MoaZkpgONdc4KzQ4xyXTzzMzPd8mIjNEPqqpMdLYwMnfO9AnxyM-S9szKDzfKckxxKjOxVaoFAKVrMFA_");
    }).then((value) {
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: TIMUIKitConversation(
        onTapItem: (selectedConv) {
          // 如果需要适配桌面端，此处需要参考 Demo 代码修改。
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  selectedConversation: selectedConv,
                ),
              ));
        },
      ),
    );
  }
}
