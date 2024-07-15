import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/tim_uikit_profile.dart';

class ImUserProfilePage extends StatelessWidget {
  final String userID;
  const ImUserProfilePage({required this.userID, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Message",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TIMUIKitProfile(
          userID: userID,
        ));
  }
}
