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
