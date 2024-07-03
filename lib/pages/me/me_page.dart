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
      padding: EdgeInsets.only(top: 60.h),
      child: SizedBox(
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 64.h,
              child: CircleAvatar(
                  radius: 50.w,
                  backgroundImage:
                      const AssetImage('assets/img/touxiang4.png')),
            ),
            const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Codery"), Text("这里就是一句话的描述"), Text("这里VIP")])
          ],
        ),
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
