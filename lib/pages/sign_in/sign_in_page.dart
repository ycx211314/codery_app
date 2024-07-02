import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('   '),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignInPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
