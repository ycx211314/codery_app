import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  //头部
  Widget _buildHeader(context) {
    return SizedBox(
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
    return Row(
      children: [
        SizedBox(
          height: 61.h,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.abc_sharp),
                  Text(
                    "这里是信息",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  const Text("Header"),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 5.h,
          color: Colors.red,
        ),
      ],
    );
  }

  //第二个区域
  Widget _buildSecondArea(context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: const Text("Header"),
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
            const Divider(
              height: 1,
            ),
            _buildCells(context),
            _buildSecondArea(context),
          ],
        ),
      ),
    ));
  }
}
