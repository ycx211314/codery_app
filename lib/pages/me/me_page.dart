import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  //头部
  Widget _buildHeader(context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        height: 120,
        margin: const EdgeInsets.all(10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'https://vv.aigeltech.com/static/default.png')),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Codery"), Text("这里就是一句话的描述"), Text("这里VIP")])
          ],
        ),
      ),
    );
  }

  //第一个区域
  Widget _buildFirstArea(context) {
    return Container(
      height: 200,
      color: Colors.green,
      child: const Text("Header"),
    );
  }

  //第二个区域
  Widget _buildSecondArea(context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: const Text("Header"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildFirstArea(context),
            _buildSecondArea(context),
          ],
        ),
      ),
    ));
  }
}
