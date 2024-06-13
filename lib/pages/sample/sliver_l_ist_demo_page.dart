import 'package:flutter/material.dart';

class SliverLIstDemoPage extends StatelessWidget {
  SliverLIstDemoPage({super.key});
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamBuilder"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
