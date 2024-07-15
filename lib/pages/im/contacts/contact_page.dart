import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

@RoutePage()
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});
  @override
  Widget build(BuildContext context) {
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
