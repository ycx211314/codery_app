import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MePagePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MePagePage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
