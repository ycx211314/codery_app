import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
