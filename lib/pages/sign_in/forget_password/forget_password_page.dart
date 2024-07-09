import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve password'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
