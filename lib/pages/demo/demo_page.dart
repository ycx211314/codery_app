import 'package:codery/pages/sample/fade_in_image_page.dart';
import 'package:codery/pages/sample/fade_transition_demo_page.dart';
import 'package:codery/pages/sample/page_view_demo_page.dart';
import 'package:codery/pages/sample/sliver_app_bar_demo_page.dart';
import 'package:codery/pages/sample/table_page.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SliverAppBarDemoPage();
                }));
              },
              child: const Text("SliverAppBarDemo")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TablePage();
                }));
              },
              child: const Text("Table")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PageViewDemoPage();
                }));
              },
              child: const Text("PageView")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FadeTransitionDemoPage();
                }));
              },
              child: const Text("FadeTransition")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FadeInImagePage();
                }));
              },
              child: const Text("FadeInImage")),
        ],
      )),
    );
  }
}
