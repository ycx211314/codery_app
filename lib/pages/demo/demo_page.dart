// import 'package:admob_flutter/admob_flutter.dart';
import 'package:auto_route/annotations.dart';
import 'package:codery/pages/sample/animated_builder_deme_page.dart';
import 'package:codery/pages/sample/clip_r_rect_demo_page.dart';
import 'package:codery/pages/sample/custome_paint_demo_page.dart';
import 'package:codery/pages/sample/dismissible_demo_page.dart';
import 'package:codery/pages/sample/fade_in_image_page.dart';
import 'package:codery/pages/sample/fade_transition_demo_page.dart';
import 'package:codery/pages/sample/hero_demo_page.dart';
import 'package:codery/pages/sample/inherited_widget_demo_page.dart';
import 'package:codery/pages/sample/page_view_demo_page.dart';
import 'package:codery/pages/sample/sliver_app_bar_demo_page.dart';
import 'package:codery/pages/sample/sliver_grid_demo_page.dart';
import 'package:codery/pages/sample/sliver_l_ist_demo_page.dart';
import 'package:codery/pages/sample/table_page.dart';
import 'package:codery/pages/sample/tooltip_demo_page.dart';
import 'package:codery/pages/sample/transform_demo_page.dart';
import 'package:codery/pages/sample/value_listenable_builder_demo_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  // AdmobReward rewardAd = AdmobReward(
  //   adUnitId: AdmobReward.testAdUnitId,
  //   listener: (event, args) {
  //     if (event == AdmobAdEvent.rewarded) {
  //       print('User was rewarded!');
  //       print('Reward type: ${args?['type']}');
  //       print('Reward amount: ${args?['amount']}');
  //     }
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    // rewardAd.load();
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          // AdmobBanner(
          //   adUnitId: AdmobBanner.testAdUnitId,
          //   adSize: AdmobBannerSize.FULL_BANNER,
          // ),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SliverAppBarDemoPage();
                }));
              },
              child: const Text("SliverAppBarDemo")),
          // FilledButton(
          //     onPressed: () async {
          //       if (await rewardAd.isLoaded ?? false) {
          //         rewardAd.show();
          //       }
          //     },
          //     child: const Text("Advertisement")),
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
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SliverLIstDemoPage();
                }));
              },
              child: const Text("SliverListView")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SliverGridDemoPage();
                }));
              },
              child: const Text("SliverGridView")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const InheritedWidgetDemoPage();
                }));
              },
              child: const Text("InheritedWidget")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TooltipDemoPage();
                }));
              },
              child: const Text("Tooltip")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CustomePaintDemoPage();
                }));
              },
              child: const Text("CustomePaint")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HeroDemoPage();
                }));
              },
              child: const Text("Hero")),

          //ClipRRectDemoPage
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ClipRRectDemoPage();
                }));
              },
              child: const Text("ClipRRect")),
          //TransformDemoPage
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TransformDemoPage();
                }));
              },
              child: const Text("Transform")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ValueListenableBuilderDemoPage();
                }));
              },
              child: const Text("ValueListenableBuilder")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DismissibleDemoPage();
                }));
              },
              child: const Text("Dismissible")),
          FilledButton(
              onPressed: () {
                //navigator导航到一个页面
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BuilderPage();
                }));
              },
              child: const Text("AnimatedBuilderDemo")),
        ],
      )),
    );
  }
}
