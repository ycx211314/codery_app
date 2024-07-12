import 'package:auto_route/auto_route.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/common/utils/common_validator.dart';
import 'package:codery/widgets/customer_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key, required this.resetPasswordType});
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //定义一个枚举，一个是根据旧密码修改，一个是根据邮箱修改
  ResetPasswordType resetPasswordType = ResetPasswordType.oldPassword;

  _buildOldPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomerInputWidget(
        textEditingController: _oldPasswordController,
        obscureText: true,
        textInputType: TextInputType.visiblePassword,
        icon: Icons.lock_outline_sharp,
        hintText: "Enter your old password",
        validator: validatePassword,
      ),
    );
  }

  _buildNewPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomerInputWidget(
        textEditingController: _newPasswordController,
        textInputType: TextInputType.visiblePassword,
        icon: Icons.lock_outline_sharp,
        obscureText: true,
        hintText: "Enter your new password",
        validator: validatePassword,
      ),
    );
  }

  _buildRepeatPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: CustomerInputWidget(
        textEditingController: _repeatPasswordController,
        hintText: "Repeat your new password",
        icon: Icons.lock_outline_sharp,
        obscureText: true,
        textInputType: TextInputType.visiblePassword,
        validator: (value) {
          return validateRepeatPassword(value, _newPasswordController.text);
        },
      ),
    );
  }

  _handleResetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //TODO 需要调用接口处理
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 高度等于边线的厚度
          child: Divider(
            thickness: 1.0, // 边线厚度
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                resetPasswordType == ResetPasswordType.oldPassword
                    ? Container(
                        padding:
                            EdgeInsets.only(left: 16.w, top: 8.h, bottom: 8.h),
                        child: Text("Old Password",
                            style: TextStyle(
                                color: ColorHelper.hexToColor("#223263"),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
                      )
                    : const SizedBox(height: 0),
                resetPasswordType == ResetPasswordType.oldPassword
                    ? SizedBox(
                        height: 6.h,
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                resetPasswordType == ResetPasswordType.oldPassword
                    ? _buildOldPassword(context)
                    : const SizedBox(
                        height: 0,
                      ),
                Container(
                  padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 8.h),
                  child: Text("New Password",
                      style: TextStyle(
                          color: ColorHelper.hexToColor("#223263"),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600)),
                ),
                _buildNewPassword(context),
                Container(
                  padding: EdgeInsets.only(left: 16.w, top: 6.h, bottom: 8.h),
                  child: Text("Repeat New Password",
                      style: TextStyle(
                          color: ColorHelper.hexToColor("#223263"),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600)),
                ),
                _buildRepeatPassword(context),
                const Expanded(
                    child: SizedBox()), // This will take up the remaining space
                Container(
                  margin:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
                  child: FilledButton(
                    onPressed: () {
                      //调用 onResult 回调函数
                      _handleResetPassword(context);
                    },
                    child: const Text("Reset Password "),
                  ),
                )
              ]),
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
