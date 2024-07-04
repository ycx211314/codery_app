import 'package:auto_route/annotations.dart';
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
    return Container(
      color: Colors.white,
      child: CellWidget(
          isArrowVisible: true,
          rightPadding: 0.w,
          leftWidget: const Icon(
            Icons.card_membership,
            color: Colors.black87,
          ),
          title: Text(
            "My Details",
            style: TextStyle(fontSize: 18.sp, color: Colors.black87),
          )),
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
            const Divider(
              height: 1,
            ),
            _buildCells(context),
            TextButton(onPressed: () {}, child: const Text("fdf")),
            // const CellWidget(
            //     title: Text("hfef"), isArrowVisible: true, rightPadding: 0),
            // _buildSecondArea(context),
          ],
        ),
      ),
    ));
  }
}
