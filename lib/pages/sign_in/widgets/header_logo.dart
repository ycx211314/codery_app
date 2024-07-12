import 'package:codery/common/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo(
      {super.key,
      required this.image,
      required this.headTitle,
      required this.subTitle});

  final String image;
  final String headTitle;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
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
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                headTitle,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: ColorHelper.hexToColor("#223263"),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorHelper.hexToColor("#9098B1"),
                ),
              ),
              SizedBox(height: 28.h),
            ]));
  }
}
