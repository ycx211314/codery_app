import 'package:auto_route/auto_route.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/common/utils/color_helper.dart';
import 'package:codery/data/models/account.dart';
import 'package:codery/data/provider/auth_provider.dart';
import 'package:codery/pages/profile/widgets/cell.dart';
import 'package:codery/pages/profile/widgets/profile_header.dart';
import 'package:codery/respository/user_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Account? user;
  @override
  void initState() {
    super.initState();
  }

  //头部
  Widget _buildHeader(context) {
    AuthorityProvider authProvider = Provider.of<AuthorityProvider>(context);
    user = authProvider.user;
    if (user == null) {
      return const ProfileHeader(
          name: "未登录", email: "", avatarUrl: "assets/img/touxiang4.png");
    } else {
      return ProfileHeader(
          name: user!.name ?? "None",
          email: user!.email ?? "None",
          avatarUrl: "assets/img/touxiang4.png");
    }
  }

  //第一个区域
  Widget _buildCells(context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.form,
                color: Colors.black87,
              ),
              title: Text(
                "Orders",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          height: 1.h,
          indent: 25.w,
          endIndent: 25.w,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.map,
                color: Colors.black87,
              ),
              title: Text(
                "Delivery Address",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          height: 1.h,
          indent: 25.w,
          endIndent: 25.w,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.qianbao,
                color: Colors.black87,
              ),
              title: Text(
                "Payment Methods",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          thickness: 5.h,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.remind1,
                color: Colors.black87,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          height: 1.h,
          indent: 25.w,
          endIndent: 25.w,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.help,
                color: Colors.black87,
              ),
              title: Text(
                "Help",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          height: 1.h,
          indent: 25.w,
          endIndent: 25.w,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.information,
                color: Colors.black87,
              ),
              title: Text(
                "About",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          thickness: 5.h,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Iconfont.shezhi,
                color: Colors.black87,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        Divider(
          thickness: 5.h,
        ),
      ],
    );
  }

  //第二个区域
  Widget _buildLogOutButton(context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
          height: 67.h,
          child: ElevatedButton(
              style: ButtonStyle(
                //圆角矩形
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.h))),
                //背景颜色
                backgroundColor:
                    WidgetStateProperty.all(ColorHelper.hexToColor("#F2F3F2")),
                //阴影
                elevation: WidgetStateProperty.all(0),
              ),
              onPressed: () {
                // UserRespository.loginOut(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).primaryColor,
                  ),
                  Expanded(
                      child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  )),
                ],
              )),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(context),
            Divider(height: 1.h),
            _buildCells(context),
            _buildLogOutButton(context),
          ],
        ),
      ),
    ));
  }
}
