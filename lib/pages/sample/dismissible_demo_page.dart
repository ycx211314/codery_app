import 'package:flutter/material.dart';

class DismissibleDemoPage extends StatelessWidget {
  DismissibleDemoPage({super.key});

  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DismissibleDemoPage'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Dismissible(
            key: Key(item), // 为每个 Dismissible 分配一个唯一的 key
            secondaryBackground: Container(
              color: Colors.red,
              child: const Icon(Icons.remove),
            ),
            background: Container(
              color: Colors.green,
              child: const Icon(Icons.ring_volume),
            ),
            onDismissed: (direction) {
              _items.removeAt(index);
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
