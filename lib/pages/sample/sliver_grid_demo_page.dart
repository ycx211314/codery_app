import 'package:flutter/material.dart';

class SliverGridDemoPage extends StatelessWidget {
  SliverGridDemoPage({super.key});

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * ((index % 9) + 1)],
                    child: Text(items[index]),
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
