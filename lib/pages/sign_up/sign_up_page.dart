import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/common/utils/common_validator.dart';
import 'package:codery/pages/sign_in/widgets/header_logo.dart';
import 'package:codery/routes/app_router.dart';
import 'package:codery/widgets/customer_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  _buildLogo(BuildContext context) {
    return const HeaderLogo(
        image: 'assets/img/logo.png',
        headTitle: "Let’s Get Started",
        subTitle: "Create an new account");
  }

  buildInputFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomerInputWidget(
                textEditingController: _nameController,
                icon: Iconfont.geren,
                hintText: 'Enter your name',
                validator: (value) {
                  return validateLenth(value, 3);
                }),
            SizedBox(height: 8.h),
            CustomerInputWidget(
                textEditingController: _emailController,
                icon: Iconfont.email,
                hintText: 'Enter your email',
                validator: validateEmail),
            SizedBox(
              height: 8.h,
            ),
            CustomerInputWidget(
                textEditingController: _passwordController,
                icon: Iconfont.mima,
                hintText: 'Enter your password',
                obscureText: true,
                validator: validatePassword),
            SizedBox(
              height: 8.h,
            ),
            CustomerInputWidget(
                textEditingController: _repeatPasswordController,
                icon: Iconfont.mima,
                hintText: 'Enter your password again',
                obscureText: true,
                validator: (value) =>
                    validateRepeatPassword(value, _passwordController.text)),
          ],
        ),
      ),
    );
  }

  buildButtons(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: FilledButton(
        onPressed: () {
          handle_sign_up(context);
        },
        child: const Text("Sign Up "),
      ),
    );
  }

  buildRegisterInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have a account?",
                    style: TextStyle(
                        color: ColorHelper.hexToColor("#9098B1"),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600)),
                GestureDetector(
                  onTap: () {
                    context.router
                        .navigate(SignInRoute(onResult: (success) {}));
                  },
                  child: Text("Sign in",
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

  handle_sign_up(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // 验证通过，执行登录逻辑
      //   Message msg = await UserRespository.createUser(_nameController.text,
      //       _emailController.text, _passwordController.text, context);
      //   if (msg.code == "0000") {
      //     AuthorityProvider authProvider =
      //         Provider.of<AuthorityProvider>(context, listen: false);
      //     authProvider.signIn();
      //     context.router.maybePopTop();
      //   }
    }
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
              buildInputFields(context),
              SizedBox(height: 16.h),
              buildButtons(context),
              SizedBox(height: 12.h),
              buildRegisterInfo(context),
            ]),
      ),
    );
  }
}
