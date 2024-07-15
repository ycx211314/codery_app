import 'package:auto_route/auto_route.dart';
import 'package:codery/data/provider/im_provider.dart';
import 'package:codery/pages/im/chats/Chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

@RoutePage()
class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  void initState() {
    IMProvider imProvider = Provider.of<IMProvider>(context, listen: false);
    if (!imProvider.isLoggedIn) {
      imProvider.loginIM("0001",
          "eJyrVgrxCdYrSy1SslIy0jNQ0gHzM1NS80oy0zLBwgYGBoZQ8eKU7MSCgswUJStDM6CwiYm5pTFEJrWiILMoFShuampqBJSCiJZk5oLEzI0MDYwsLU1MoaZkpgONdc4KzQ4xyXTzzMzPd8mIjNEPqqpMdLYwMnfO9AnxyM-S9szKDzfKckxxKjOxVaoFAKVrMFA_");
    }
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
