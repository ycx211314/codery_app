import 'package:auto_route/annotations.dart';
import 'package:codery/common/icons/iconfont.dart';
import 'package:codery/pages/profile/widgets/cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  //头部
  Widget _buildHeader(context) {
    return Container(
      color: Colors.white,
      height: 165.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25.h),
              height: 64.h,
              child: CircleAvatar(
                  radius: 64.h,
                  backgroundColor: Colors.red,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/touxiang4.png',
                      fit: BoxFit.contain, // 使图片适应容器，可能会被裁剪
                      width: 64.h, // 根据需要调整宽度
                      height: 64.h, // 根据需要调整高度
                    ),
                  ))),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 35.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Codery",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "这里就是一句话的描述",
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
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
                Iconfont.personalcenter,
                color: Colors.black87,
              ),
              title: Text(
                "Profile Details",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
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
                Icons.payment,
                color: Colors.black87,
              ),
              title: Text(
                "Payment Methods",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Icons.notifications,
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
                Icons.help,
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
                Icons.info,
                color: Colors.black87,
              ),
              title: Text(
                "About",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: Colors.white,
          child: CellWidget(
              isArrowVisible: true,
              rightPadding: 0.w,
              leftWidget: const Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18.sp, color: Colors.black87),
              )),
        ),
      ],
    );
  }

  //第二个区域
  Widget _buildSecondArea(context) {
    return Container(
      height: 200,
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(
              height: 10.h,
            ),
            _buildCells(context),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            WidgetStateProperty.all(Colors.grey.shade200),
                        //阴影
                        elevation: WidgetStateProperty.all(0),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout),
                          Expanded(
                              child: Text(
                            "Log Out",
                            textAlign: TextAlign.center,
                          )),
                        ],
                      )),
                ),
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
