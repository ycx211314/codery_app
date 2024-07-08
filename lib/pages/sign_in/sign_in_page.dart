import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/data/models/message.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/respository/user_respository.dart';
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
  final FocusNode _focusNodeEmaiL = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  Color _emailIconColor = ColorHelper.hexToColor("#9098B1");
  Color _passwordIconColor = ColorHelper.hexToColor("#9098B1");
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _focusNodeEmaiL.addListener(() {
      setState(() {
        _emailIconColor = _focusNodeEmaiL.hasFocus
            ? ColorHelper.hexToColor("#40BFFF")
            : ColorHelper.hexToColor("#9098B1");
      });
    });

    _focusNodePassword.addListener(() {
      setState(() {
        _passwordIconColor = _focusNodePassword.hasFocus
            ? ColorHelper.hexToColor("#40BFFF")
            : ColorHelper.hexToColor("#9098B1");
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //图标和文字
  _buildLogo(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 112.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // color: Theme.of(context).primaryColor,
                child: CircleAvatar(
                  radius: 48.w,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Image.asset(
                    'assets/img/logo.png',
                    fit: BoxFit.fill,
                    // width: 100.w,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Welcome to Codery',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: ColorHelper.hexToColor("#223263"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorHelper.hexToColor("#9098B1"),
                ),
              ),
              SizedBox(height: 28.h),
            ]));
  }

  _buildInputFields(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 48.h,
              color: Colors.white,
              child: TextFormField(
                controller: _emailController,
                focusNode: _focusNodeEmaiL,
                validator: _validateEmail,
                style: TextStyle(
                    fontSize: 12.sp, color: ColorHelper.hexToColor("#9098B1")),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                      color: ColorHelper.hexToColor("#9098B1"),
                      fontSize: 12.sp),
                  prefixIcon: Icon(
                    Iconfont.email,
                    size: 18.sp,
                    color: _emailIconColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorHelper.hexToColor("#EBF0FF"))),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorHelper.hexToColor("#40BFFF")), // 启用状态下的边框颜色
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorHelper.hexToColor("#40BFFF")), // 获得焦点时的边框颜色
                  ),
                  errorStyle: const TextStyle(height: 0),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
                // height: 48.h,
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  focusNode: _focusNodePassword,
                  validator: _validatePassword,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorHelper.hexToColor("#9098B1")),
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Iconfont.browse,
                        color: _passwordIconColor,
                        size: 18.sp,
                      ),
                      onPressed: () => {
                        setState(() {
                          _obscureText = !_obscureText;
                        })
                      },
                    ),
                    hintStyle: TextStyle(
                        color: ColorHelper.hexToColor("#9098B1"),
                        fontSize: 12.sp),
                    prefixIcon: Icon(Iconfont.password,
                        color: _passwordIconColor, size: 18.sp),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorHelper.hexToColor("#EBF0FF"))),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              ColorHelper.hexToColor("#40BFFF")), // 启用状态下的边框颜色
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorHelper.hexToColor("#40BFFF")),
                    ),
                    errorStyle: const TextStyle(height: 0),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                )),
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
            Container(
              height: 57.h,
              color: ColorHelper.hexToColor("#EBF0FF"),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r), // 设置圆角半径
                      ),
                      side: BorderSide(
                          color: ColorHelper.hexToColor("#EBF0FF"),
                          width: 1.w)),
                  onPressed: () {
                    print("click");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //图标，来自icons/google.png
                      Image.asset(
                        'assets/icon/google.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      Expanded(
                        child: Text("Login with Google",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: ColorHelper.hexToColor("#9098B1"),
                            )),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 57.h,
              color: ColorHelper.hexToColor("#EBF0FF"),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r), // 设置圆角半径
                      ),
                      side: BorderSide(
                          color: ColorHelper.hexToColor("#EBF0FF"),
                          width: 1.w)),
                  onPressed: () {
                    print("click");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //图标，来自icons/google.png
                      Image.asset(
                        'assets/icon/apple.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      Expanded(
                        child: Text("Login with Apple",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.sp,
                              color: ColorHelper.hexToColor("#9098B1"),
                            )),
                      )
                    ],
                  )),
            )
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
                print("goto register page");
              },
              child: Text("Don't have an account?",
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
                    print("goto register page");
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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // 正则表达式匹配电子邮件格式
    final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // 检查密码长度
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    // 检查密码是否包含至少一个大写字母、一个小写字母和一个数字
    final RegExp uppercaseRegExp = RegExp(r'[A-Z]');
    final RegExp lowercaseRegExp = RegExp(r'[a-z]');
    final RegExp digitRegExp = RegExp(r'\d');

    if (!uppercaseRegExp.hasMatch(value) ||
        !lowercaseRegExp.hasMatch(value) ||
        !digitRegExp.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
    }

    return null;
  }

  hanlder_sign_in(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      Message msg = await UserRespository.login(
          _emailController.text, _passwordController.text, context);
      if (msg.code == '0000') {
        context.router.maybePop();
      } else {
        print(msg.message);
      }
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
