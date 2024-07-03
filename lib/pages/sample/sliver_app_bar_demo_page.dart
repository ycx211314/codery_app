import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "sliverApp")
class SliverAppBarDemoPage extends StatelessWidget {
  const SliverAppBarDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverAppBarDemo"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text("标题"),
            expandedHeight: 230.0,
            backgroundColor: Colors.red,
            floating: false,
            pinned: true,
            snap: false,
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
