import 'package:flutter/material.dart';

class PageViewDemoPage extends StatefulWidget {
  const PageViewDemoPage({super.key});

  @override
  State<PageViewDemoPage> createState() => _PageViewDemoPageState();
}

class _PageViewDemoPageState extends State<PageViewDemoPage> {
  List<Widget> _listWidge() {
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(Center(
        child: Text(
          "第 $i 页",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PageView"),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal, //滚动方向,水平/上下
        reverse: false, //倒序滚动
        children: _listWidge(),
      ),
    );
  }
}
