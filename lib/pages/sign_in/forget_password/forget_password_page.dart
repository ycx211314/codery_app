import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/common/utils/common_validator.dart';
import 'package:codery/pages/sign_in/reset_password/reset_password_page.dart';
import 'package:codery/routes/app_router.dart';
import 'package:codery/widgets/customer_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

@RoutePage()
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  int _currentIndex = 0;

  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

//填写邮件页面
  _buildEmailContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Your registed Email",
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorHelper.hexToColor("#223263"),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomerInputWidget(
              textEditingController: _emailController,
              hintText: "Enter your email",
              icon: Iconfont.email,
              helperText: "the email address to retrieve your password",
              validator: validateEmail,
            ),
            SizedBox(
              height: 20.h,
            ),
            FilledButton(
              onPressed: () {
                _handle_next_action(context);
              },
              child: const Text("Send Validator Code"),
            ),
          ],
        ),
      ),
    );
  }

//填写验证码页面
  _buildValidatorCodeContainer(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorHelper.hexToColor("#333333"),
                ),
              ),
              SizedBox(height: 18.h),
              Container(
                child: OTPTextField(
                  length: 4,
                  width: 400.w,
                  keyboardType: TextInputType.number,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (value) {
                    print("Changed: $value");
                  },
                  onCompleted: (pin) {
                    if (pin == "2222") {
                      context.router.navigate(ResetPasswordRoute(
                          resetPasswordType: ResetPasswordType.email));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code?",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorHelper.hexToColor("#333333"),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("resend");
                      },
                      child: Text(
                        "resend",
                        style: TextStyle(
                            color: ColorHelper.hexToColor("#40BFFF"),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(margin: EdgeInsets.only(top: 10.h))
            ]));
  }

  _handle_next_action(BuildContext context) {
    if (_currentIndex == 0) {
      //第一步验证邮箱
      if (_formKey.currentState?.validate() ?? false) {
        setState(() {
          _currentIndex = 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve password'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 高度等于边线的厚度
          child: Divider(
            thickness: 1.0, // 边线厚度
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildEmailContainer(context),
          _buildValidatorCodeContainer(context)
        ],
      ),
    );
  }
}
