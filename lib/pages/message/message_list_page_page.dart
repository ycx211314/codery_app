import 'package:auto_route/auto_route.dart';
import 'package:codery/pages/message/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_conversation/tencent_cloud_chat_conversation.dart';

class MessageListPagePage extends StatefulWidget {
  const MessageListPagePage({super.key});

  @override
  State<MessageListPagePage> createState() => _MessageListPagePageState();
}

class _MessageListPagePageState extends State<MessageListPagePage> {
  @override
  Widget build(BuildContext context) {
    return const TencentCloudChatConversation();
  }
}
