import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/data/models/message.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/respository/user_respository.dart';
import 'package:codery/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
  final FocusNode _focusNodeEmaiL = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeRePassword = FocusNode();

  Color _namelIconColor = ColorHelper.hexToColor("#9098B1");
  Color _emailIconColor = ColorHelper.hexToColor("#9098B1");

  Color _passwordIconColor = ColorHelper.hexToColor("#9098B1");
  Color _repeatPasswordIconColor = ColorHelper.hexToColor("#9098B1");

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _focusNodeName.addListener(() {
      setState(() {
        _namelIconColor = _focusNodeName.hasFocus
            ? ColorHelper.hexToColor("#40BFFF")
            : ColorHelper.hexToColor("#9098B1");
      });
    });

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

    _focusNodeRePassword.addListener(() {
      setState(() {
        _repeatPasswordIconColor = _focusNodeRePassword.hasFocus
            ? ColorHelper.hexToColor("#40BFFF")
            : ColorHelper.hexToColor("#9098B1");
      });
    });
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
                'Let’s Get Started',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: ColorHelper.hexToColor("#223263"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Create an new account',
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
              color: Colors.white,
              child: TextFormField(
                controller: _nameController,
                focusNode: _focusNodeName,
                validator: _validateName,
                style: TextStyle(
                    fontSize: 12.sp, color: ColorHelper.hexToColor("#9098B1")),
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: TextStyle(
                      color: ColorHelper.hexToColor("#9098B1"),
                      fontSize: 12.sp),
                  prefixIcon: Icon(
                    Iconfont.account,
                    size: 18.sp,
                    color: _namelIconColor,
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
            SizedBox(
              height: 8.h,
            ),
            Container(
                color: Colors.white,
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
            SizedBox(
              height: 8.h,
            ),
            Container(
                color: Colors.white,
                child: TextFormField(
                  controller: _repeatPasswordController,
                  obscureText: _obscureText,
                  focusNode: _focusNodeRePassword,
                  validator: _validatePassword,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorHelper.hexToColor("#9098B1")),
                  decoration: InputDecoration(
                    hintText: "Repeat your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Iconfont.browse,
                        color: _repeatPasswordIconColor,
                        size: 18.sp,
                      ),
                      onPressed: () => {
                        // setState(() {
                        //   _obscureText = !_obscureText;
                        // })
                      },
                    ),
                    hintStyle: TextStyle(
                        color: ColorHelper.hexToColor("#9098B1"),
                        fontSize: 12.sp),
                    prefixIcon: Icon(Iconfont.password,
                        color: _repeatPasswordIconColor, size: 18.sp),
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
          //调用 onResult 回调函数
          _handle_sign_up(context);
        },
        child: const Text("Sign Up "),
      ),
    );
  }

  _buildRegisterInfo(BuildContext context) {
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

    if (value != _repeatPasswordController.text) {
      return "Password must be the same";
    }

    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    // 检查密码长度fl
    if (value.length < 3) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  _handle_sign_up(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      // 验证通过，执行登录逻辑
      Message msg = await UserRespository.createUser(_nameController.text,
          _emailController.text, _passwordController.text, context);
      if (msg.code == "0000") {
        AuthorityProvider authProvider =
            Provider.of<AuthorityProvider>(context, listen: false);

        context.router.maybePopTop();
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
              SizedBox(height: 12.h),
              _buildRegisterInfo(context),
            ]),
      ),
    );
  }
}
