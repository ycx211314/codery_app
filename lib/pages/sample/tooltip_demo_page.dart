import 'package:flutter/material.dart';

class TooltipDemoPage extends StatelessWidget {
  const TooltipDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("tooltip"),
      ),
      body: Center(
        child: Tooltip(
          message: 'This is a tooltip', // 提示信息
          child: GestureDetector(
            child: const Icon(Icons.help_outline),
            onTap: () {
              // 处理点击事件
            },
          ),
        ),
      ),
    );
  }
}
