import 'package:flutter/material.dart';

class FadeTransitionDemoPage extends StatefulWidget {
  const FadeTransitionDemoPage({super.key});

  @override
  State<FadeTransitionDemoPage> createState() => _FadeTransitionDemoPageState();
}

class _FadeTransitionDemoPageState extends State<FadeTransitionDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FadeTransition Example')),
        body: Center(
          child: FadeTransition(
            opacity: _animation, // 使用动画控制不透明度
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
