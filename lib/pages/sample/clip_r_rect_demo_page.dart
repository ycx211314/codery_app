import 'package:flutter/material.dart';

class ClipRRectDemoPage extends StatefulWidget {
  const ClipRRectDemoPage({super.key});

  @override
  State<ClipRRectDemoPage> createState() => _ClipRRectDemoPageState();
}

class _ClipRRectDemoPageState extends State<ClipRRectDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClipRectExample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                clipper: ClipperRPath(),
                child: Container(
                  color: Colors.purple,
                  width: 300,
                  height: 300,
                )),
          ],
        ),
      ),
    );
  }
}

class ClipperRPath extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndCorners(
        Rect.fromCenter(
            center: const Offset(100, 100), width: 200, height: 100),
        topLeft: const Radius.circular(50),
        bottomRight: const Radius.circular(50));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return false;
  }
}
