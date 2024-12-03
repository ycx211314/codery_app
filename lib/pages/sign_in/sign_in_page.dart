import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/common/utils/common_validator.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/pages/sign_in/widgets/header_logo.dart';
import 'package:codery/pages/sign_in/widgets/third_sign_button.dart';
import 'package:codery/widgets/customer_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  final void Function(bool success) onResult;

  const SignInPage({super.key, required this.onResult});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //图标和文字
  _buildLogo(BuildContext context) {
    return const HeaderLogo(
        image: 'assets/img/logo.png',
        headTitle: 'Welcome to Codery',
        subTitle: 'Sign in to continue');
  }

  _buildInputFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomerInputWidget(
                textEditingController: _emailController,
                icon: Iconfont.email,
                hintText: "Enter your email",
                validator: validateEmail),
            SizedBox(height: 8.h),
            CustomerInputWidget(
                textEditingController: _passwordController,
                hintText: "Enter your password",
                icon: Iconfont.mima,
                obscureText: true,
                validator: validatePassword),
            SizedBox(height: 16.h)
          ],
        ),
      ),
    );
  }

  _buildButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: FilledButton(
        onPressed: () {
          // 执行登录逻辑
          final authProvider =
              Provider.of<AuthorityProvider>(context, listen: false);
          authProvider.signIn();
          hanlder_sign_in(context);
          //调用 onResult 回调函数
        },
        child: const Text("Sign in "),
      ),
    );
  }

  _buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1.h,
            indent: 16.w,
            endIndent: 28.w,
            color: ColorHelper.hexToColor("#EBF0FF"),
          ),
        ),
        Text("OR",
            style: TextStyle(
                color: ColorHelper.hexToColor("#9098B1"), fontSize: 14.sp)),
        Expanded(
          child: Divider(
            height: 1.h,
            indent: 28.w,
            endIndent: 16.w,
            color: ColorHelper.hexToColor("#EBF0FF"),
          ),
        ),
      ],
    );
  }

  _buildThirdPartyLogin(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w),
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThirdSignButton(
              iconWidget: Image.asset(
                'assets/icon/google.png',
                width: 24.w,
                height: 24.h,
              ),
              text: "Sign in with Google",
              onPressed: () {
                _handle_sign_in_with_google(context);
              },
            ),
            SizedBox(
              height: 8.h,
            ),
            ThirdSignButton(
              iconWidget: Image.asset(
                'assets/icon/apple.png',
                width: 24.w,
                height: 24.h,
              ),
              text: "Sign in with Apple",
              onPressed: () {
                _handle_sign_in_with_apple(context);
              },
            ),
          ],
        ));
  }

  _buildRegisterInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                context.router.pushNamed("/forgetPassword");
              },
              child: Text("Forgot Password?",
                  style: TextStyle(
                      color: ColorHelper.hexToColor("#40BFFF"),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(width: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have a account?",
                    style: TextStyle(
                        color: ColorHelper.hexToColor("#9098B1"),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
                GestureDetector(
                  onTap: () {
                    context.router.pushNamed("/register");
                  },
                  child: Text("Register",
                      style: TextStyle(
                          color: ColorHelper.hexToColor("#40BFFF"),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600)),
                )
              ],
            )
          ]),
    );
  }

//处理登录
  hanlder_sign_in(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // Message msg = await UserRespository.login(
      //     _emailController.text, _passwordController.text, context);
      // if (msg.code == '0000') {
      //   context.router.maybePop();
      // } else {
      //   print(msg.message);
      // }
    }
  }

  _handle_sign_in_with_google(BuildContext context) async {
    // Message msg = await UserRespository.loginWithGoogle(context);
    // if (msg.code == '0000') {
    //   context.router.maybePop();
    // } else {
    //   print(msg.message);
    // }
  }

  _handle_sign_in_with_apple(BuildContext context) async {
    // Message msg = await UserRespository.loginWithApple(context);
    // if (msg.code == '0000') {
    //   context.router.maybePop();
    // } else {
    //   print(msg.message);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLogo(context),
              _buildInputFields(context),
              SizedBox(height: 16.h),
              _buildButtons(context),
              SizedBox(height: 30.h),
              _buildDivider(context),
              _buildThirdPartyLogin(context),
              _buildRegisterInfo(context),
            ]),
      ),
    );
  }
}
