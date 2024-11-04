import 'package:auto_route/auto_route.dart';
import 'package:codery/data/provider/im_provider.dart';
import 'package:codery/pages/im/chats/Chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

@RoutePage()
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});
  @override
  Widget build(BuildContext context) {
    IMProvider imProvider = Provider.of<IMProvider>(context, listen: false);
    if (imProvider.isLoggedIn == false) {
      imProvider.loginIM("0001",
          "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwgYGBoZQ8eKU7MSCgswUJStDM6CwiYm5pTFEJrWiILMoFShuampqBJSCiJZk5oLEzI0MDYwsLU1MoaZkpgONdc4KzQ4xyXTzzMzPd8mIjNEPqqpMdLYwMnfO9AnxyM-S9szKDzfKckxxKjOxVaoFAKVrMFA_");
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Messages",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: TIMUIKitContact(
          onTapItem: (item) {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ImUserProfilePage(userID: item.userID),
            //     ));

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                      selectedConversation: V2TimConversation(
                    conversationID: 'c2c_${item.userID}',
                    userID: item.userID,
                    showName: '${item.userID} 对话',
                    type: 1,
                  )),
                ));
          },
          emptyBuilder: (context) => const Center(
            child: Text("无联系人"),
          ),
        ));
  }
}
