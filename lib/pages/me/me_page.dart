import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MePage extends StatelessWidget {
  const MePage({super.key});

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
          const Divider(
            color: Colors.red,
            height: 2,
          )
        ],
      ),
    );
  }

  //第一个区域
  Widget _buildFirstArea(context) {
    return Container(
      height: 200,
      color: Colors.green,
      child: const Text("Header"),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildFirstArea(context),
            _buildSecondArea(context),
          ],
        ),
      ),
    ));
  }
}
