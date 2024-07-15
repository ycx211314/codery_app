import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class ChatPage extends StatelessWidget {
  final V2TimConversation selectedConversation;
  const ChatPage({super.key, required this.selectedConversation});
  String? _getConvID() {
    return selectedConversation.type == 1
        ? selectedConversation.userID
        : selectedConversation.groupID;
  }

  @override
  Widget build(BuildContext context) {
    return TIMUIKitChat(
      conversation: selectedConversation,
      // onTapAvatar: (_) {
      //   // 如果需要适配桌面端，此处需要参考 Demo 代码修改。
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => UserProfile(
      //             userID: userID, friendInfo: null, conversation: null),
      //       ));
      // }, // Callback for the clicking of the message sender profile photo. This callback can be used with `TIMUIKitProfile`.
    );
  }
}
