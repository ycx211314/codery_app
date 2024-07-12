import 'package:codery/common/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdSignButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? iconWidget;
  final String text;

  const ThirdSignButton({
    super.key,
    required this.onPressed,
    this.iconWidget,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57.h,
      // color: ColorHelper.hexToColor("#EBF0FF"),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r), // 设置圆角半径
              ),
              side: BorderSide(
                  color: ColorHelper.hexToColor("#EBF0FF"), width: 1.w)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              iconWidget ??
                  const SizedBox(
                    height: 0,
                  ),
              Expanded(
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorHelper.hexToColor("#9098B1"),
                    )),
              )
            ],
          )),
    );
  }
}
