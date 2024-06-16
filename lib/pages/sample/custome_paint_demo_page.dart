import 'package:flutter/material.dart';

class CustomePaintDemoPage extends StatelessWidget {
  const CustomePaintDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CustomePaintDemo'),
        ),
        body: CustomPaint(
          size: const Size(160, 90),
          painter: HeartIconPainter(),
        ));
  }
}

class HeartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, size.height / 5)
      ..cubicTo(
          size.width / 3, 0, 0, size.height / 3.5, size.width / 2, size.height)
      ..cubicTo(size.width, size.height / 3.5, size.width * 2 / 3, 0,
          size.width / 2, size.height / 5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
