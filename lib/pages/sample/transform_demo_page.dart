import 'package:flutter/material.dart';
import 'dart:math' as dartMath;

class TransformDemoPage extends StatelessWidget {
  const TransformDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransformDemoPage'),
        centerTitle: true,
      ),
      body: Center(
        child: _myTransformRotate(),
      ),
    );
  }

  _myChild() {
    return const Text(
      'Hello Flutter',
      style: TextStyle(
        backgroundColor: Colors.blue,
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }

  _myTransformRotate() {
    return Stack(
      children: [
        Center(
          child: _myChild(),
        ),
        Center(
          child: Transform.rotate(
            angle: dartMath.pi * 0.25,
            alignment: Alignment.center,
            child: _myChild(),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: dartMath.pi * 0.25,
            origin: const Offset(50, 50),
            alignment: Alignment.center,
            child: _myChild(),
          ),
        ),
        Center(
          child: Transform.rotate(
            angle: dartMath.pi * 0.25,
            alignment: null,
            child: _myChild(),
          ),
        ),
      ],
    );
  }
}
