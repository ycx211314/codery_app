import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader(
      {super.key,
      required this.name,
      required this.email,
      required this.avatarUrl});

  final String name;
  final String email;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 165.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
              height: 64.h,
              child: CircleAvatar(
                  radius: 64.h,
                  backgroundColor: Colors.red,
                  child: ClipOval(
                    child: Image.asset(
                      avatarUrl,
                      fit: BoxFit.contain, // 使图片适应容器，可能会被裁剪
                      width: 64.h, // 根据需要调整宽度
                      height: 64.h, // 根据需要调整高度
                    ),
                  ))),
          Expanded(
            child: GestureDetector(
              onTap: () {
                AuthorityProvider authorityProvider =
                    Provider.of<AuthorityProvider>(context, listen: false);
                if (authorityProvider.signInSuccess) {
                  print("已经登录了");
                } else {
                  context.router.navigate(SignInRoute(onResult: (success) {}));
                }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        email,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorHelper.hexToColor("#7C7C7C")),
                      )
                    ]),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 16.w, 45.h),
              child: Icon(
                Iconfont.more,
                size: 16.sp,
              ))
        ],
      ),
    );
  }
}
