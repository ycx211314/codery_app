import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key, required this.resetPasswordType});

  //定义一个枚举，一个是根据旧密码修改，一个是根据邮箱修改
  ResetPasswordType resetPasswordType = ResetPasswordType.oldPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetPasswordPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetPasswordPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ResetPasswordType {
  static const oldPassword = ResetPasswordType._('oldPassword');
  static const email = ResetPasswordType._('email');

  final String value;

  const ResetPasswordType._(this.value);

  @override
  String toString() {
    return value;
  }
}
