import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat/components/component_options/tencent_cloud_chat_message_options.dart';
import 'package:tencent_cloud_chat_message/tencent_cloud_chat_message.dart';

@RoutePage()
class ChatPage extends StatelessWidget {
  final TencentCloudChatMessageOptions messageOptions;
  const ChatPage({super.key, required this.messageOptions});

  @override
  Widget build(BuildContext context) {
    return TencentCloudChatMessage(
      // Be sure to provide options. Use the messageOptions constructed above.
      options: messageOptions,

      // Other parameters, such as builders, can be specified globally or passed in statically here, depending on your requirements. For detailed usage, refer to the parameter and method comments.
    );
  }
}
