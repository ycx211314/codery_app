import 'package:auto_route/auto_route.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  final void Function(bool success) onResult;

  const SignInPage({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 执行登录逻辑
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            authProvider.signIn();
            // 调用 onResult 回调函数
            onResult(true);
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
