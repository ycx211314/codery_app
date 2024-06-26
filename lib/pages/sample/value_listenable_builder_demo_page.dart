import 'package:flutter/material.dart';

class ValueListenableBuilderDemoPage extends StatefulWidget {
  const ValueListenableBuilderDemoPage({super.key});

  @override
  State<ValueListenableBuilderDemoPage> createState() =>
      _ValueListenableBuilderDemoPageState();
}

class _ValueListenableBuilderDemoPageState
    extends State<ValueListenableBuilderDemoPage> {
  final ValueNotifier<String> _value = ValueNotifier('initial value');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilderDemoPage'),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder<String>(
            valueListenable: _value, // 指定要监听的 ValueListenable
            builder: (context, value, child) {
              return Text(value); // 根据值构建 widget
            }),
      ),
    );
  }
}
