import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignUpPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
