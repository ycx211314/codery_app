import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_conversation/tencent_cloud_chat_conversation.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TencentCloudChatConversation(),
    );
  }
}
